Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74583569ACF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 08:56:46 +0200 (CEST)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9LRN-0005Ha-Gj
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 02:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o9LOB-0003cX-7U
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o9LO9-0007PG-9E
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657176804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ldwcahIVDAFwiOyfxKTMeo/xKxFq2gbkUsSSvJ7fbRM=;
 b=Oj5BfO2hBsf7XghUdBoJespxUIIBq51EnSLds+ubSVv8yAoTBjDnXzmSKXz6n8x0vmK0li
 TOLfOJ2wp0XeBdMfvrS3uDzcc7FvXdKN8hqaZIO+Ob3eqstXcICm968UjEwPM0LKgvwU7L
 RTbErdZeDmnLU42j55ZroiIcAjIwHbk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-Qdt1VSz-N82z0t1UsWruSQ-1; Thu, 07 Jul 2022 02:53:20 -0400
X-MC-Unique: Qdt1VSz-N82z0t1UsWruSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E446429AB406;
 Thu,  7 Jul 2022 06:53:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B31BFC28118;
 Thu,  7 Jul 2022 06:53:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 472B71800094; Thu,  7 Jul 2022 08:53:18 +0200 (CEST)
Date: Thu, 7 Jul 2022 08:53:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vasiliy Ulyanov <vasily.ulyanov@suse.com>, qemu-devel@nongnu.org
Subject: Re: Adjusting the default ROM option for SEV guests
Message-ID: <20220707065318.b5kleuqxmxuz6h5w@sirius.home.kraxel.org>
References: <d0c41d34-2ae3-39ac-58df-bbdf81bf79b6@suse.de>
 <eaea4711-0290-2087-5abf-f65e6328247d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaea4711-0290-2087-5abf-f65e6328247d@suse.de>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 06, 2022 at 04:57:40PM +0200, Claudio Fontana wrote:
> Hello all
> 
> any comment on this one? It seems it would make sense to disable option roms for SEV by default in QEMU, any feedback anyone?
> 
> Thanks,
> 
> Claudio
> 
> On 5/11/22 13:30, Vasily Ulyanov wrote:
> > Hello QEMU devs,
> > 
> > Currently to launch an SEV guest there are certain requirements for the VM
> > configuration. One such is that ROM option needs to be disabled for virtio-net
> > devices [1].

Should be easy to fix on the firmware side.  TDX has the same
requirement and the code is already there, so this should be a
one-liner in OvmfPkg/IncompatiblePciDeviceSupportDxe

Independent from that we might consider switching virtio to
pxe-virtio.rom (i.e. bios-only instead of bios+uefi) for everyone
because the uefi firmware comes with a virtio-net driver included.

take care,
  Gerd


