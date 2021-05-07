Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0806376BDA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 23:39:03 +0200 (CEST)
Received: from localhost ([::1]:40244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf8Ba-0004ZR-Hs
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 17:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf8AO-0003uT-KL
 for qemu-devel@nongnu.org; Fri, 07 May 2021 17:37:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf8AM-00046W-6c
 for qemu-devel@nongnu.org; Fri, 07 May 2021 17:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620423465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg1hxew2J0c2uQeTEFFDFyaQqMYfnXJciIa/dVzNKjU=;
 b=EHUJ+lh9yc1B5LTPV8HZLaKqtIm1BZUbV9l1KsakAObloJY8F6Sz6dqyiPfDVWmVv86LQT
 u182gvE95nzob15OvY5o3UxStpOauS78B0vVhWLwyD8p/mM4cE9Wae1+924+f8+WqnXpbL
 qHEfTJJLnFUzqIaAtc+9BJDP3BIX9Hw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-71-P5BIWOD6iWFDg6uVgDQ-1; Fri, 07 May 2021 17:37:41 -0400
X-MC-Unique: 71-P5BIWOD6iWFDg6uVgDQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so4071725wrs.19
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 14:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zg1hxew2J0c2uQeTEFFDFyaQqMYfnXJciIa/dVzNKjU=;
 b=pV0T6PXvwoOAVsEjKnnAO5eaqjrBL3hyVGQoKEn2frc7KOFsDfYm0Uu9QNGtmHaOpF
 NM1cpcg5TjoAypIUdW12U1cno78rpWpSwWsss8Ciuqs8IsQBoYgxIU2edQhjhDLOR9cK
 Myb7qgEW3qi5mkg1P6HSu9jrA7S0hbVjIeQsgU9F/MraS6F+niB3SREKAkxiAUHw6O7R
 9U/XEOgdgZflGPv6tKMyynWSO968NHOwbFwUD6++B0EyZuhx3kPzSEd5DgOOSKMS9hyg
 johLf9AC3MIMArokUyS4FF0qpEySVnrnXe2h0XCjfXleDIDJ7zi2ApTlwZj8BYamkyzH
 QIpw==
X-Gm-Message-State: AOAM530xq0FBatCKPyaxoUDl16gOn8zoBIFiGxJ3NgHkdF3acuQGdLyo
 Hw90Dokb81YhPd6VnG6Vrc20F3dQF5JrFiojcoR7xrCFELTzhtRTrJBJw3hwNaEmkYBIDnAAToL
 /b4jsomZ1jtdu1BSDfhasWl6mRy4Vm6h8QFqeMSmYGk/H9ZVdrx7dQEXUC1NshXtp
X-Received: by 2002:a1c:238d:: with SMTP id
 j135mr23710486wmj.170.1620423460199; 
 Fri, 07 May 2021 14:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFHVPM3KsJY+mGGBvGyFufI++8Jnk3S9LaHDo07hMku3E7CMDJIFM7EtWa8fc38Utv3V89pw==
X-Received: by 2002:a1c:238d:: with SMTP id
 j135mr23710459wmj.170.1620423459934; 
 Fri, 07 May 2021 14:37:39 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id p10sm9113648wrr.58.2021.05.07.14.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 14:37:39 -0700 (PDT)
Subject: Re: [PATCH v2 09/11] pckbd: add function kbd_pending()
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
 <20210507180953.8530-9-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <74960b21-5ce6-cf5d-1ebf-b8cd94ee7ce4@redhat.com>
Date: Fri, 7 May 2021 23:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507180953.8530-9-vr_qemu@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 8:09 PM, Volker Rümelin wrote:
> Replace reads of the variable s->pending with a call to a new
> function kbd_pending() to ease the review of the next patch.
> There is no functional change.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  hw/input/pckbd.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


