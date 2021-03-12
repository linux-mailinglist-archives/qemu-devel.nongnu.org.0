Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DE338A15
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:29:26 +0100 (CET)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKf2r-0004e4-D0
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKemC-0005oJ-PF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKem7-00008B-2c
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0FySqn/PqBJvLJASvAHX7qN4HZRLrcRj+YFKA54TOY=;
 b=eOkAHHMluXZCORYgER0p81nb/6erytYFkAvv8zNnq6ZeBJBi2oxHPBXEyDOhlwbMgxtGYt
 bpeyAGqlRCMO5dp5OJV6rdBkZ6nmXNW+ohAOB1Ub5UrLZ3AtdmHupyFR3GLs6ggGRq+6Tv
 fUtlslywbhsaxb5QJgGkuico70R/z4s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-JlQScRtdPu29P92aqYdnlQ-1; Fri, 12 Mar 2021 05:12:04 -0500
X-MC-Unique: JlQScRtdPu29P92aqYdnlQ-1
Received: by mail-wm1-f72.google.com with SMTP id l16so2998914wmc.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t0FySqn/PqBJvLJASvAHX7qN4HZRLrcRj+YFKA54TOY=;
 b=pgwgnniT55xibCJjTSJcN5wZWeFYFVr8TrAxU+O2G8H36qIpZR/N6SFdUM6UdesDa/
 9AQa/hYwn4/GYyIUOoPu4UKG9kf440EhSDJM94fwIW5wJI0rV8PL0NVFf5GF4Km7R9bn
 qovkJ8EYwvm2NZOfDx1LEL8xNdcH+yxrmS27SasDkDa8yLArMuFjjy/gz4C9pkF2RJjp
 c9RCFQs3lygtXBccXNFVfKxW1Zt1DPf6KNQL3Hr/gshnKkKFGcRchhRuGGRuqmin+J3c
 cZwTOoIlMIwbUjGLb7+7FV1Fz7WlECkJ47oCOL82tGlvR3ta+1/67AhDXWnFt0iW0x5Q
 H6VQ==
X-Gm-Message-State: AOAM530xC7/wE5Z5XwUmGNjexn58NC4iQFDBmK6adaGfoIVP2f8RW8AG
 DKXl3hUu7vALGovpAXn4J44W2KCXcghDGj8jXZX0sYfuylvtugh4Fdc6m92w3Jkx05L6lHoOHDw
 ovqcrWuQ+2PmrMss=
X-Received: by 2002:a5d:4341:: with SMTP id u1mr13309517wrr.88.1615543923624; 
 Fri, 12 Mar 2021 02:12:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSQrNtLgHOHaFPj0aFMvs8KF4snSHoicLpEVuz/VXYQX0S29vWGu7TFzhItJ7h+1xEDXUbCQ==
X-Received: by 2002:a5d:4341:: with SMTP id u1mr13309498wrr.88.1615543923453; 
 Fri, 12 Mar 2021 02:12:03 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n6sm8343695wrw.63.2021.03.12.02.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 02:12:03 -0800 (PST)
Subject: Re: [PATCH 07/27] ui: make gl_block use a counter
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312100108.2706195-8-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e5fced43-4f2f-554a-986c-115b6b909e85@redhat.com>
Date: Fri, 12 Mar 2021 11:12:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312100108.2706195-8-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 11:00 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Track multiple callers blocking requests.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/console.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index 53eba2019e..fedb9d8b13 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -128,7 +128,7 @@ struct QemuConsole {
>      DisplaySurface *surface;
>      int dcls;
>      DisplayChangeListener *gl;
> -    bool gl_block;
> +    int gl_block;
>      int window_id;
>  
>      /* Graphic console state.  */
> @@ -288,10 +288,19 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
>  {
>      assert(con != NULL);
>  
> -    con->gl_block = block;
> -    if (con->hw_ops->gl_block) {
> -        con->hw_ops->gl_block(con->hw, block);
> +    if (block) {
> +        con->gl_block++;
> +    } else {
> +        con->gl_block--;
> +    }
> +    assert(con->gl_block >= 0);
> +    if (!con->hw_ops->gl_block) {
> +        return;
> +    }
> +    if ((block && con->gl_block != 1) || (!block && con->gl_block != 0)) {

Dubious condition check... Could you rewrite it KISS for review?

> +        return;
>      }
> +    con->hw_ops->gl_block(con->hw, block);
>  }
>  
>  void graphic_hw_gl_flushed(QemuConsole *con)
> 


