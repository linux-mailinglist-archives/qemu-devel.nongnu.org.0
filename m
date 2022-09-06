Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE445AE87C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:36:28 +0200 (CEST)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXoY-0000tH-Hu
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW77-0000LL-Am
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:47:34 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:54130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW74-00029A-Qh
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:47:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 619B8B815F8
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FAEC433D6
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:47:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=redhat.com
 header.i=@redhat.com header.b="Vwb7XMpL"; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Q+/fjF0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com; s=20210105;
 t=1662461242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:resent-to:
 resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references; 
 bh=U8KTkp0JsScCU0OIHVLGvxUqExfBDeKVXnrTBlXpgIk=;
 b=Vwb7XMpLNwtxRBQC+5ttPjqJVQZicDtl4IN9BxQY+yQ0KGLX2k2qgwf8bE9PKH75JGSnI6
 RoLHz3H9r3+qBOTpRGbHuyzNlGamQIJpLgw7gSXK3xBjl+yumLm9FiuZAvSKg+4Tj/LlKs
 +VPq03UegLGBGVnqX1Br2PrjRGwwkpc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 039c4dc6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 6 Sep 2022 10:47:22 +0000 (UTC)
Resent-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Resent-Date: Tue, 6 Sep 2022 12:47:20 +0200
Resent-Message-ID: <YxclON17c0XTbXZ/@zx2c4.com>
Resent-To: QEMU Developers <qemu-devel@nongnu.org>
Delivered-To: jason.donenfeld@gmail.com
Received: by 2002:a05:7110:6084:b0:193:64ce:56a5 with SMTP id k4csp3275458gea; 
 Tue, 6 Sep 2022 03:46:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8e:b0:1f7:5250:7b44 with SMTP id
 oo14-20020a17090b1c8e00b001f752507b44mr24516152pjb.212.1662461190475; 
 Tue, 06 Sep 2022 03:46:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1662461190; cv=pass;
 d=google.com; s=arc-20160816;
 b=Pzf3LaWxPTy3LunQL4zXNgIHbPF8vzwZRk2z/tDU1xZTlfVWizdABpOzcOOB3pD9ja
 ooitnbBSB4Y85LO5ckluygJuMJuTexC4JTiklIDcIdK0Qjofg3kLanaG8gZdM0mKTv47
 MlcqSD5ANv8rVsm7OdupekIjV56p3nxX+IpGbM0NYlIssfnoEnVLj9FqnZGcbYCAAIsc
 16RY+c8bfEzv1EIGmnbq9hQEv+cmAtpCW3pbWBL6G/qMCE/JSzHClr5QsEkzbWv1/cqg
 iRw1ad6pBdVjafSgSgOe20DTQpGo4zmQn+FsO7uEmtHGklnhpjpyAMDgqFYBZtFYbw50
 edKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:message-id:subject:cc:to:from:date
 :dkim-signature;
 bh=U8KTkp0JsScCU0OIHVLGvxUqExfBDeKVXnrTBlXpgIk=;
 b=xt7PF3lY1xJ+tJL2qdi3INok6louexocYtzJTZemIQImJ3tMiYzRK/bETLxg4+KafX
 kdRb4lDqb/T4u6KWaXiFFxBKJi0HMOuMdPVHohmNBYi+x2BVXwtzB5iZ/oygRp0WrVb2
 ia7YZ3r8VY95nbExASY0ay1k3PrZW4GPfIzN3k8+huPISSgB9w8/x1fvPN4u+WICCkJO
 44hc0uWXUNbP8rn35B7f/fMCj7TXT4XuKfE2d6Le9/nAjoaHaToMSl0VDV+MFqCr6TNk
 K9Dt8GhOu14a3UbRLwdlZhM+4VWsDk5yY88OmDTQLiNbcq0HNkWHpYaLx7HuWGLPhQ3R
 xcrA==
ARC-Authentication-Results: i=2; mx.google.com;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q+/fjF0Z"; 
 arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com
 dmarc=pass fromdomain=redhat.com); 
 spf=pass (google.com: domain of kraxel@redhat.com designates 209.85.220.41 as
 permitted sender) smtp.mailfrom=kraxel@redhat.com; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com.
 [209.85.220.41]) by mx.google.com with SMTPS id
 21-20020a170902c21500b0017272dec36fsor833170pll.56.2022.09.06.03.46.30
 for <jason.donenfeld@gmail.com> (Google Transport Security);
 Tue, 06 Sep 2022 03:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates
 209.85.220.41 as permitted sender) client-ip=209.85.220.41; 
Authentication-Results: mx.google.com;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q+/fjF0Z"; 
 arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com
 dmarc=pass fromdomain=redhat.com); 
 spf=pass (google.com: domain of kraxel@redhat.com designates 209.85.220.41 as
 permitted sender) smtp.mailfrom=kraxel@redhat.com; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:message-id:subject:cc:to:from:date
 :dkim-signature:x-gm-message-state:from:to:cc:subject:date;
 bh=U8KTkp0JsScCU0OIHVLGvxUqExfBDeKVXnrTBlXpgIk=;
 b=hVbSWW3CgM4ltutw/l9Mokh841t9Lf1/pIy2ro3h1kGOUqaNvzq6C0LjX9ouptskOT
 Le9+H7YGsb3ift+D5Th2bU3y1ZxViRlbIng4Y25epgZTxCLscWrZzfqbtuzVB/9XlWhy
 lD7hhuDfAOQ1c8D6HHrTHp+oDAcwRTfpx4jQXyqSHcI2gZvOwbJdtzZkKEBQCOo27hJJ
 1yOJ+NTjBBAzGF0YkBF0wI7QwOh/GlyRILUvKJbR3QD6PCxacLi2Zgx+/VJkAZ6Qn5KE
 Y2BrrwMUL6oHa4FBW7pt8ljvhVXTQDhGIfQj6rEidRlRKSgW14bpvCKYk+s62WPQuLNe
 +RCA==
X-Gm-Message-State: ACgBeo2xGnnAb1eLrD1eunv59YuAdyX1J/DbJTLmNj2yDsf+ACWiWdzN
 BCeZ4oqPprG/IVGwHSPopZANIvkXpPkvDVw7fg==
X-Google-Smtp-Source: AA6agR5e424gJgVI7lLTeM3O/dD3Of0j5VkS0BBqrwR+88VcYurMNij39WSOX59U1kSFi3EedCrld2K0S/2vUr7Evr7j7CG6wuU=
X-Received: by 2002:a17:902:9894:b0:172:ca00:f305 with SMTP id
 s20-20020a170902989400b00172ca00f305mr54183105plp.107.1662461190072; 
 Tue, 06 Sep 2022 03:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662461190; cv=none;
 d=google.com; s=arc-20160816;
 b=PNgN1NMTt1DHTV9KnZA49LAFBmP7ddMnXYV3UkJZkHICQZ7vFONTgDJcbQm965L54i
 fZHJk7JH7bv1NM1NrvlTAA5pV/p5QBg2nplIsj7ML58S1pa5ETVkth4tAzNG9f+SHJE1
 dzxF4BzP0RFwdHx7Nai+eC07XQxf0ABx3TPKkR/o9BgP6oVWaVRGVR8YtIeq5zoflsGh
 Igz8fNMPaTEfsNFNDHxOGU96PifndhUF1YOYnO7zTQ6gmGwHlfnflL8dkB2FWbIYix5C
 Wlh9pwzo31B2ENWODVHhXQvlX3WkRSPKeEWIhngQEZK1ltMicR98XKM7Zt5qRJBYIhQF
 ZMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:message-id:subject:cc:to:from:date
 :dkim-signature;
 bh=U8KTkp0JsScCU0OIHVLGvxUqExfBDeKVXnrTBlXpgIk=;
 b=0G5R+dqT24EI7RzfrQ44jWMkh6pg1uux7CQkFo86htzcvbVrHaqCWcih0RYzGgfHJ0
 gq/9eXhFYW8slsSAUbpA7U09fNC4Dwh/C3iXIzmbW44ebvSV+6svZT3C0FP54SApNQah
 Td3oyDnOdTyRgU0B9c8sBLqHUZh/3MWT6tONe7DnUTIM9ZnOkkCX6Wn/1iZo3faL6+sQ
 KxL+SYChaKksGUUnL4fF8923W3g19ZdpnECXR4x9MNEyfydJMyIobPDK6+Lv5MjPNpU8
 BzWdrTAbg1+gXS8wtnl5SX9zsLNdc3trrFFLjXE+l8LkeSQzpVyI3UpU4KIO8YqeeLiG
 lpjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q+/fjF0Z"; 
 spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as
 permitted sender) smtp.mailfrom=kraxel@redhat.com; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
 by gmr-mx.google.com with ESMTPS id
 nd10-20020a17090b4cca00b001faab3fc6a0si1085988pjb.3.2022.09.06.03.46.29
 for <jason.donenfeld@gmail.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 03:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates
 170.10.133.124 as permitted sender) client-ip=170.10.133.124; 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662461189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8KTkp0JsScCU0OIHVLGvxUqExfBDeKVXnrTBlXpgIk=;
 b=Q+/fjF0Z7sMWYqAyU3ZX9yjgyPYQ09IfNkM7HqzcGR/y2bXv1jq0kynBty1J6QQ7AjdhjB
 PFhwzjf/0gPp2q+2Dp/o9CQMDHlBHb7aq/zv/Gm7fPMfZaijWav/RfkhAPMdeI5ExboYBw
 9Yj9RXqXaia9XP21CD/g6AoLeSqFGIs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-4XQ7TCRhNsKEd7DKY_Hfsg-1; Tue, 06 Sep 2022 06:46:26 -0400
X-MC-Unique: 4XQ7TCRhNsKEd7DKY_Hfsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B16ED3803902;
 Tue,  6 Sep 2022 10:46:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7560F2026D64;
 Tue,  6 Sep 2022 10:46:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 35DF01800629; Tue,  6 Sep 2022 12:46:24 +0200 (CEST)
Date: Tue, 6 Sep 2022 12:46:24 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <20220906104624.ensm5txdil5ieyae@sirius.home.kraxel.org>
References: <20220906103657.282785-1-Jason@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <20220906103657.282785-1-Jason@zx2c4.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_BL_SPAMCOP_NET=1.347,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Gerd Hoffmann <kraxel@redhat.com>
From:  Gerd Hoffmann via <qemu-devel@nongnu.org>

On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> It's only safe to modify the setup_data pointer on newer kernels where
> the EFI stub loader will ignore it. So condition setting that offset on
> the newer boot protocol version. While we're at it, gate this on SEV too.
> This depends on the kernel commit linked below going upstream.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


