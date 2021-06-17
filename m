Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736673AB145
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:21:32 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp9P-00070B-I3
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltolD-0007A5-Rm
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltolB-0007K7-CQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623923788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyH5istXa0zOCVhG9AaAJAvD3TIeCI0Q85uv0gy4hbw=;
 b=CFr0nybHrB1NeyuSrmkhQMlDHubc1LVk3FujiaMmgMImTmnkX0/UF1DDSVQWfBFa3ylh2u
 XfREudoCWk5idH9xrCugE6LtacAzx6EpAfZGHGIJvC/ArpgrJn740EJgFXStMa17SWsDpj
 EZ9wGgIiquek/8kFtpEykI/MZb0PX/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-hm78J1DXMVGa8XSdPahYzw-1; Thu, 17 Jun 2021 05:56:23 -0400
X-MC-Unique: hm78J1DXMVGa8XSdPahYzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 840548015C6;
 Thu, 17 Jun 2021 09:56:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDEE75D6D1;
 Thu, 17 Jun 2021 09:56:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5EF0318000B2; Thu, 17 Jun 2021 11:56:14 +0200 (CEST)
Date: Thu, 17 Jun 2021 11:56:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
Message-ID: <20210617095614.jh5vkrzc65d5xrui@sirius.home.kraxel.org>
References: <20210616104349.2398060-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210616104349.2398060-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 12:43:49PM +0200, Philippe Mathieu-Daudé wrote:
> While the SB16 seems to work up to 48000 Hz, the "Sound Blaster Series
> Hardware Programming Guide" limit the sampling range from 4000 Hz to
> 44100 Hz (Section 3-9, 3-10: Digitized Sound I/O Programming, tables
> 3-2 and 3-3).
> 
> Later, section 6-15 (DSP Commands) is more specific regarding the 41h /
> 42h registers (Set digitized sound output sampling rate):
> 
>   Valid sampling rates range from 5000 to 45000 Hz inclusive.
> 
> There is no comment regarding error handling if the register is filled
> with an out-of-range value.  (See also section 3-28 "8-bit or 16-bit
> Auto-initialize Transfer"). Assume limits are enforced in hardware.
> 
> This fixes triggering an assertion in audio_calloc():
> 
>   #1 abort
>   #2 audio_bug audio/audio.c:119:9
>   #3 audio_calloc audio/audio.c:154:9
>   #4 audio_pcm_sw_alloc_resources_out audio/audio_template.h:116:15
>   #5 audio_pcm_sw_init_out audio/audio_template.h:175:11
>   #6 audio_pcm_create_voice_pair_out audio/audio_template.h:410:9
>   #7 AUD_open_out audio/audio_template.h:503:14
>   #8 continue_dma8 hw/audio/sb16.c:216:20
>   #9 dma_cmd8 hw/audio/sb16.c:276:5
>   #10 command hw/audio/sb16.c:0
>   #11 dsp_write hw/audio/sb16.c:949:13
>   #12 portio_write softmmu/ioport.c:205:13
>   #13 memory_region_write_accessor softmmu/memory.c:491:5
>   #14 access_with_adjusted_size softmmu/memory.c:552:18
>   #15 memory_region_dispatch_write softmmu/memory.c:0:13
>   #16 flatview_write_continue softmmu/physmem.c:2759:23
>   #17 flatview_write softmmu/physmem.c:2799:14
>   #18 address_space_write softmmu/physmem.c:2891:18
>   #19 cpu_outw softmmu/ioport.c:70:5
> 
> [*] http://www.baudline.com/solutions/full_duplex/sb16_pci/index.html
> 
> Fixes: 85571bc7415 ("audio merge (malc)")
> Buglink: https://bugs.launchpad.net/bugs/1910603
> OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29174
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Reviewed-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Added to audio queue.

thanks,
  Gerd


