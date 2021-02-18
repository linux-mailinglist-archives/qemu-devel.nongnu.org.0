Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D5431E8F8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:08:30 +0100 (CET)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChAb-0001LH-7A
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCh97-0000uF-EV
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCh95-0001OT-Jv
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613646413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzv880PDLoM4Nl0Jsrs8Q59FPgJzFjQU4OoP2GeARJI=;
 b=LREorQ5tTrraRLL4U5MSWQRyikoXwvxd763lCVTrxmql/IL6SsQyIbIy6gUizG0bSpuTFZ
 Nhc1KpWj0+EqWbXTzh9QHH+rlX8WGPnaZkdhoJydRdCzOuGZ8sJOVpyVd2bL/ghctA8D/5
 Trmzzv5fSaJXgnC6D4ix07H+OWxbWEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-TwYNMFDLMT2tpnVQbyYPbA-1; Thu, 18 Feb 2021 06:06:52 -0500
X-MC-Unique: TwYNMFDLMT2tpnVQbyYPbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4264F80196E;
 Thu, 18 Feb 2021 11:06:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBD5C60BE5;
 Thu, 18 Feb 2021 11:06:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AADB218000BB; Thu, 18 Feb 2021 12:06:44 +0100 (CET)
Date: Thu, 18 Feb 2021 12:06:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Measuring the impact of buffer copy for virtio-gpu guests
Message-ID: <20210218110644.dpxfu3adpko4nsbn@sirius.home.kraxel.org>
References: <87y2fmsrxw.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87y2fmsrxw.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Francois Ozog <francois.ozog@linaro.org>,
 Mikhail Golubev <Mikhail.Golubev@opensynergy.com>,
 Vasyl Vavrychuk <Vasyl.Vavrychuk@opensynergy.com>,
 Zhao Jiancong <chou.kensou@jp.panasonic.com>, qemu-devel@nongnu.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 01:46:28PM +0000, Alex Bennée wrote:
> Hi Gerd,
> 
> I was in a discussion with the AGL folks today talking about approaches
> to achieving zero-copy when running VirGL virtio guests. AIUI (which is
> probably not very much) the reasons for copy can be due to a number of
> reasons:
> 
>   - the GPA not being mapped to a HPA that is accessible to the final HW
>   - the guest allocation of a buffer not meeting stride/alignment requirements
>   - data needing to be transformed for consumption by the real hardware?

With the current qemu code base each ressource has both a guest and host
buffer and the data is copied over when the guest asks for it.

virtio-gpu got a new feature (VIRTIO_GPU_F_RESOURCE_BLOB) to improve
that.  For blob resources we have stride/alignment negotiation, and they
can also be allocated by the host and mapped into the guest address
space instead of living in guest ram.

linux guest support is there in the kernel and mesa, host side is
supported by crosvm.  qemu doesn't support blob resources though.

> I'm curious if it's possible to measure the effect of these extra copies
> and where do they occur? Do all resources get copied from the guest buffer to
> host or does this only occur when there is a mismatch in the buffer
> requirements?

Without blob resources a copy is required whenever the guest cpu wants
access to the resource (i.e.  glWritePixels / glReadPixels + simliar).
For resources which are a gpu render target and never touched by the cpu
this is not needed.  For these you wouldn't even need guest ram backing
storage (VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING), linux doesn't
implement that optimization though.

> Are there any functions where I could add trace points to measure this?
> If this occurs in the kernel I wonder if I could use an eBPF probe to
> count the number of bytes copied?

Copy happens in qemu or virglrenderer, in response to
VIRTIO_GPU_CMD_TRANSFER_* commands from the guest.

There are tracepoint already in qemu (trace_virtio_gpu_cmd_res_xfer_*),
they log only the resource id though, not the amount of data transfered.

Tracing on the guest side by adding trace points to the kernel shouldn't
be hard too.

take care,
  Gerd


