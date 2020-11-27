Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1FE2C6CAE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 21:45:37 +0100 (CET)
Received: from localhost ([::1]:46244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kikcZ-0002uD-Uv
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 15:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kikb6-0002Jc-3k
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 15:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kikb3-0001hH-5I
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 15:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606509838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SGjSIQgBu4YhKs+7nghqS43dSCvjkDS++QrT6QEc2LY=;
 b=Ajfwakb5VHd0mT9eKY9Ni2Y5xPBscl6QepG1LkOyYXdMnpcA/mrSzCbq304EBt7T8xzVmY
 N+RzRZTRcfDPptlJQtXExjCR9ouT2Q7iw5g2x1ADRo4bt/liVNvIT6yVoNI1bl4I0s4OCm
 g6zaDDpWsHHrJ+9SX4VBQxEckgV6w10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-SMRH5e6qNvqxsBWJJMglog-1; Fri, 27 Nov 2020 15:43:54 -0500
X-MC-Unique: SMRH5e6qNvqxsBWJJMglog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C51D802B6E;
 Fri, 27 Nov 2020 20:43:52 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68AC95D9CC;
 Fri, 27 Nov 2020 20:43:48 +0000 (UTC)
Date: Fri, 27 Nov 2020 15:43:47 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v6 07/11] i386: move TCG cpu class initialization out of
 helper.c
Message-ID: <20201127204347.GI2271382@habkost.net>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-8-cfontana@suse.de>
 <20201127190424.GH2271382@habkost.net>
 <c1d20b34-be23-bb42-9fc6-5395a390c037@suse.de>
MIME-Version: 1.0
In-Reply-To: <c1d20b34-be23-bb42-9fc6-5395a390c037@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, gengdongjiu@huawei.com,
 Olaf Hering <ohering@suse.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Bruce Rogers <brogers@suse.com>, "Emilio G . Cota" <cota@braap.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Alex Bennee <alex.bennee@linaro.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 08:47:00PM +0100, Claudio Fontana wrote:
> On 11/27/20 8:04 PM, Eduardo Habkost wrote:
[...]
> > Maybe we should rename CPUClass.synchronize_from_tb to
> > CPUClass.tcg_synchronize_from_tb?  Maybe we should have a
> 
> possibly, yes.
> 
> > separate TCGCpuOperations struct to carry TCG-specific methods?
> 
> 
> interesting, will think about it.

I'm working on it at:
https://gitlab.com/ehabkost/qemu/-/commits/work/tcg-cpu-ops

Feel free to reuse it, if you want to do it before your series.
Otherwise, I can rebase it after your series is merged.

I didn't touch do_interrupt(), because of the aarch64 weirdness.

-- 
Eduardo


