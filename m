Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C12F6811
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:49:48 +0100 (CET)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06kl-0003L0-BT
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l05xB-0004RZ-Mb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l05x9-0005A4-Sm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdOI3l0jnS/V4+SznAITDlvmGrYzMjs6WMs+4rEV+vA=;
 b=SNr0ukeZ3kBCidgcTkMaMCq9Rhmt2Kb3seM3d1mjF2b2k0lypZ9F4G0GURTz3JJfbMEb/0
 fboml1iCwhl4cz5aBl3AAYkyhk4OEy9s9refhieBlOIsgjCbFsQBDaatm3/LZ4Q+YaNQYt
 J1o8MzHZG0e4bN1OVO2SMsw/Zc2V/Ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-O79xZ4qDOnq2mSMcAM0HbQ-1; Thu, 14 Jan 2021 11:58:28 -0500
X-MC-Unique: O79xZ4qDOnq2mSMcAM0HbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D793806663;
 Thu, 14 Jan 2021 16:58:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C2056F439;
 Thu, 14 Jan 2021 16:58:22 +0000 (UTC)
Subject: Re: [PATCH 06/23] sdlaudio: fill remaining sample buffer with silence
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-6-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <38da0ef3-d48c-2ff6-e1e4-240594dffdfc@redhat.com>
Date: Thu, 14 Jan 2021 17:58:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210110100239.27588-6-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2021 11.02, Volker Rümelin wrote:
> Fill the remaining sample buffer with silence. To fill it with
> zeroes is wrong for unsigned samples because this is silence
> with a DC bias.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/sdlaudio.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
> index 79eed23849..01ae4c600e 100644
> --- a/audio/sdlaudio.c
> +++ b/audio/sdlaudio.c
> @@ -235,7 +235,8 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
>   
>       /* clear remaining buffer that we couldn't fill with data */
>       if (len) {
> -        memset(buf, 0, len);
> +        audio_pcm_info_clear_buf(&hw->info, buf,
> +                                 len / hw->info.bytes_per_frame);
>       }
>   }
>  

Ignorant question: Is anybody still using unsigned samples in the 21st century?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>


