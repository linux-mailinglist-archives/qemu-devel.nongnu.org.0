Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7AB429972
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:28:28 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3mV-0000de-SQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ma3lD-0008K0-Ar
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ma3l9-00030R-OE
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633991222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sm+njK8nuzPKx70OYGQJvVHe5rtN7ZspPDGnLwYZg5s=;
 b=G2wG5Wp3q4Tjx3fYPQHZA3Dlal//I7DzJq4bmU8dYkmKHWUaH6dtwVP2M3L9N8eLxjyA3l
 A/bmf8+Bvg2bEALT6A+RSQQcPfvH/Ax7hJlp3qy2Hb67DuusRPtvgXdlheG8nfNTBF8kXK
 lP7VFQBOgrJ0484QkMkd7j/JvxHLcHM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-gz3CXMr-NwGN4mDQz5fC_g-1; Mon, 11 Oct 2021 18:26:47 -0400
X-MC-Unique: gz3CXMr-NwGN4mDQz5fC_g-1
Received: by mail-wr1-f69.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so11175037wrd.5
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sm+njK8nuzPKx70OYGQJvVHe5rtN7ZspPDGnLwYZg5s=;
 b=h3cEWFFKvQWfgHxc0d0gN41Df75mQ7fK1OijQFk1TKfyXrOJclsYcGlxMu30yRU2bQ
 oBVz0M6FXVj/gXf2wLrqKPsz/O8qV4YDkoapjBhSXOX1/Ut54sBJc3O98IHFKKykZ2HH
 9n8130Kjm0TnMPEuX+AkW4NPfDOyweZ/rMyaI0EQZFBenJVfYwVVnmG4cM0DuHsANgix
 iIkGisHcdV8cFJD87wUD9kOVxVS2xO2y6hlf1GiU//eekQNUqKE54o+US8IjTnA88o+m
 VZDd2H1IVQcrC/0tTHcNvHyRs4gQCDD/t7R1WDv3OV3Fq2CoSvqqhhuto7XA4kW/a9pv
 Q00w==
X-Gm-Message-State: AOAM533fe5UirnBkW0riByTMQ/0GyFq4nL5PujkBSsbDQafCfUg0bUK0
 2Uv+MUjqA2ZA/rrRQ8N8e4cBWReatUjjS6eCIWhK2YvSglINcJjUUWLxaxBSuN0PWKUpSk0+KCD
 TxzH79UjPX3kah1w=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr1880402wmh.140.1633991205979; 
 Mon, 11 Oct 2021 15:26:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxi3U4cnXfCdK7VHDGXN6phFfSprujS8l0NK1giLYa+BvbhotQeJ9q/7Y1+EPEpNCGhFNm9g==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr1880367wmh.140.1633991205751; 
 Mon, 11 Oct 2021 15:26:45 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id z6sm4860409wro.25.2021.10.11.15.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:26:45 -0700 (PDT)
Message-ID: <17984661-19d2-18a2-a2a2-f2aa68d96194@redhat.com>
Date: Tue, 12 Oct 2021 00:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 12/12] vfio-user: acceptance test
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1633929457.git.jag.raman@oracle.com>
 <b5d78f1452a85057c257e1f9efca527d05ff0388.1633929457.git.jag.raman@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <b5d78f1452a85057c257e1f9efca527d05ff0388.1633929457.git.jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 07:31, Jagannathan Raman wrote:
> Acceptance test for libvfio-user in QEMU
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  MAINTAINERS                   |  1 +
>  tests/acceptance/vfio-user.py | 96 +++++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 tests/acceptance/vfio-user.py

> +class VfioUser(Test):
> +    """
> +    :avocado: tags=vfiouser
> +    """
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> +
> +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
> +                machine_type):
> +        """Main test method"""
> +        self.require_accelerator('kvm')
> +
> +        kernel_path = self.fetch_asset(kernel_url)
> +        initrd_path = self.fetch_asset(initrd_url)
> +
> +        socket = os.path.join('/tmp', str(uuid.uuid4()))
> +        if os.path.exists(socket):
> +            os.remove(socket)
> +
> +        # Create remote process
> +        remote_vm = self.get_vm()
> +        remote_vm.add_args('-machine', 'x-remote')
> +        remote_vm.add_args('-nodefaults')
> +        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
> +        remote_vm.add_args('-object', 'vfio-user,id=vfioobj1,'
> +                           'devid=lsi1,socket='+socket)

Nitpicking for style: spaces around '+' here,

> +        remote_vm.launch()
> +
> +        # Create proxy process
> +        self.vm.set_console()
> +        self.vm.add_args('-machine', machine_type)
> +        self.vm.add_args('-accel', 'kvm')
> +        self.vm.add_args('-cpu', 'host')
> +        self.vm.add_args('-object',
> +                         'memory-backend-memfd,id=sysmem-file,size=2G')
> +        self.vm.add_args('--numa', 'node,memdev=sysmem-file')
> +        self.vm.add_args('-m', '2048')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args('-device',
> +                         'vfio-user-pci,'
> +                         'socket='+socket)

and here. Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks for adding this test :)


