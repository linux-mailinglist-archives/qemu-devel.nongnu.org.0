Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53AA3A48B9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:34:09 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrlyq-00087O-OF
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lrlw4-00063y-9r
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lrlvw-0007Fe-PE
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623436266;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYU5ZrIOGYPNuX0bQkdfCq7rF4QPRvKe291348PR3do=;
 b=YLFC41VK3T6lPFTVKn5CkR7PlSuB4y0RjoNYYmrpJl7f6ec0Y8FWGwMggwT4UmPF6iM7TB
 P4758IU0dI96V+sxi3q5d2YytUTxLXUpgLe1D1W1nyK+s716xeEQGO4XdKvBD7ER1gkOV2
 9OWPoXh0jEH40jyDg7AWHJM5hefHN9o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-kq9iDLQSO56q970J2l_a6w-1; Fri, 11 Jun 2021 14:31:05 -0400
X-MC-Unique: kq9iDLQSO56q970J2l_a6w-1
Received: by mail-qt1-f197.google.com with SMTP id
 z4-20020ac87f840000b02902488809b6d6so2456296qtj.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 11:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:reply-to
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=VYU5ZrIOGYPNuX0bQkdfCq7rF4QPRvKe291348PR3do=;
 b=A2qJ1eRqusrFBVe7ObjjdSjMAKri2KJiq4zVqRSDUrAXCd3SwiKoMMR4/KZpjzbbaP
 7WaOs6/zvkw3eRa2olt/3DeAvGfEUjZtsSwilxhXJ3p5drQ3vYpHTuufESo2oAKOR9Sn
 tedPMt6Inp/NYNRYbperLga59xG1cxjHeuFykcFAJzHCfBG+Riq+oEJ02uiq6IBuFgFD
 fEGOebLzoBAbXOZ6FmgMTeCLXH+VNquX0O1aqyo69hgO92pkd70S826UKWUWsO8b4Kxp
 WBMmDVwLfZ7y8fbjKLb/TXvvEy1IV4jaCdUzEs/oIJ8tG9N5q3/0HTBheJoDg7TXKaiv
 u3GA==
X-Gm-Message-State: AOAM531C6L0rHpY1utUMloUijSDmqTFGzCq+Gpsp3lG72x0RAUtR3kC+
 dNIcq8kIlrlmdX4DyGi/VDxNvF+FYBfBy3CPuT0hrZNs75TiqtmZTK1qOZN7QJXBxvPyrXoH6Cp
 wjqO4kTZ1uOJLM8k=
X-Received: by 2002:a05:620a:39c:: with SMTP id
 q28mr5121403qkm.351.1623436264582; 
 Fri, 11 Jun 2021 11:31:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZg3YMWWKLZ7mAI4EMn3q8wr99OkFeqmmRwI9PdPOzEObmt2pPmO090KaUfKi3XYKAI6OIrg==
X-Received: by 2002:a05:620a:39c:: with SMTP id
 q28mr5121377qkm.351.1623436264275; 
 Fri, 11 Jun 2021 11:31:04 -0700 (PDT)
Received: from wainer-laptop.localdomain ([177.69.178.131])
 by smtp.gmail.com with ESMTPSA id n12sm4727920qtl.14.2021.06.11.11.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 11:31:03 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] tests/acceptance: Handle tests with "cpu" tag
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
References: <20210430133414.39905-1-wainersm@redhat.com>
Message-ID: <fa8a5382-ce28-c908-8256-2898fbdba929@redhat.com>
Date: Fri, 11 Jun 2021 15:30:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210430133414.39905-1-wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: wainersm@redhat.com
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

Only patches 06 and 07 did not get any review.

The series touches many files and it was last rebased months ago, so 
likely I will need to resolve rebase conflicts. But I would like to have 
the reviews of those patches before.

Thanks!

- Wainer

On 4/30/21 10:34 AM, Wainer dos Santos Moschetta wrote:
> Currently the acceptance tests tagged with "machine" have the "-M TYPE"
> automatically added to the list of arguments of the QEMUMachine object.
> In other words, that option is passed to the launched QEMU. On this
> series it is implemented the same feature but instead for tests marked
> with "cpu".
>
> There is a caveat, however, in case the test needs additional arguments to
> the CPU type they cannot be passed via tag, because the tags parser split
> values by comma (limitation which Avocado plans to address, see
> https://github.com/avocado-framework/avocado/issues/45410). For example, in
> tests/acceptance/x86_cpu_model_versions.py, there are cases where:
>
>    * -cpu is set to "Cascadelake-Server,x-force-features=on,check=off,enforce=off"
>    * if it was tagged like "cpu:Cascadelake-Server,x-force-features=on,check=off,enforce=off"
>      then the parser would break it into 4 tags ("cpu:Cascadelake-Server",
>      "x-force-features=on", "check=off", "enforce=off")
>    * resulting on "-cpu Cascadelake-Server" and the remaining arguments are ignored.
>
> It was introduced the avocado_qemu.Test.set_vm_arg() method to deal with
> cases like the example above, so that one can tag it as "cpu:Cascadelake-Server"
> AND call self.set_vm_args('-cpu', "Cascadelake-Server,x-force-features=on,check=off,enforce=off"),
> and that results on the reset of the initial value of -cpu.
>
> This series was tested on CI (https://gitlab.com/wainersm/qemu/-/pipelines/294640198)
> and with the following code:
>
> from avocado_qemu import Test
>
> class CPUTest(Test):
>      def test_cpu(self):
>          """
>          :avocado: tags=cpu:host
>          """
>          # The cpu property is set to the tag value, or None on its absence
>          self.assertEqual(self.cpu, "host")
>          # The created VM has the '-cpu host' option
>          self.assertIn("-cpu host", " ".join(self.vm._args))
>          self.vm.launch()
>
>      def test_cpu_none(self):
>          self.assertEqual(self.cpu, None)
>          self.assertNotIn('-cpu', self.vm._args)
>
>      def test_cpu_reset(self):
>          """
>          :avocado: tags=cpu:host
>          """
>          self.assertIn("-cpu host", " ".join(self.vm._args))
>          self.set_vm_arg("-cpu", "Cascadelake-Server,x-force-features=on")
>          self.assertNotIn("-cpu host", " ".join(self.vm._args))
>          self.assertIn("-cpu Cascadelake-Server,x-force-features=on", " ".join(self.vm._args))
>
> Changes:
>   - v2 -> v3:
>     - The arg and value parameters of set_vm_arg() are now mandatories and
>       fixed an index out of bounds bug [crosa]
>     - Rebased. Needed to adapt the (new) boot_xen.py test (patch 03)
>   - v1 -> v2:
>     - Recognize the cpu value passed via test parameter [crosa]
>     - Fixed tags (patch 02) on preparation to patch 03 [crosa]
>     - Added QEMUMachine.args property (patch 04) so that _args could be handled
>       without pylint complaining (protected property)
>     - Added Test.set_vm_arg() (patch 05) to handle the corner case [crosa]
>
> Wainer dos Santos Moschetta (7):
>    tests/acceptance: Automatic set -cpu to the test vm
>    tests/acceptance: Fix mismatch on cpu tagged tests
>    tests/acceptance: Let the framework handle "cpu:VALUE" tagged tests
>    tests/acceptance: Tagging tests with "cpu:VALUE"
>    python/qemu: Add args property to the QEMUMachine class
>    tests/acceptance: Add set_vm_arg() to the Test class
>    tests/acceptance: Handle cpu tag on x86_cpu_model_versions tests
>
>   docs/devel/testing.rst                     | 17 +++++++++
>   python/qemu/machine.py                     |  5 +++
>   tests/acceptance/avocado_qemu/__init__.py  | 26 ++++++++++++++
>   tests/acceptance/boot_linux.py             |  3 --
>   tests/acceptance/boot_linux_console.py     | 16 +++++----
>   tests/acceptance/boot_xen.py               |  1 -
>   tests/acceptance/machine_mips_malta.py     |  7 ++--
>   tests/acceptance/pc_cpu_hotplug_props.py   |  2 +-
>   tests/acceptance/replay_kernel.py          | 17 ++++-----
>   tests/acceptance/reverse_debugging.py      |  2 +-
>   tests/acceptance/tcg_plugins.py            | 15 ++++----
>   tests/acceptance/virtio-gpu.py             |  4 +--
>   tests/acceptance/x86_cpu_model_versions.py | 40 +++++++++++++++++-----
>   13 files changed, 112 insertions(+), 43 deletions(-)
>


