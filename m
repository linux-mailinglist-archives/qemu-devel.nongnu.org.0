Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5534BD2C1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 01:01:01 +0100 (CET)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLw8S-00045S-0b
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 19:01:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLw74-0003PS-Qu
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 18:59:34 -0500
Received: from [2607:f8b0:4864:20::635] (port=37486
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLw72-0004ov-Mf
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 18:59:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id q1so2953090plx.4
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 15:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wl3SnVj1f++wA/odp8PFAGCD/Lp37+pyd/bNCjzE7ko=;
 b=DA/gFLS1rHhX88er62GTkqM19SCYr0n62ZPIZGmOZiMM/OuUvOgTZokh6oe3tqVn9V
 Q5puIr+pp+s5MwXNUWc+KP5W0uAz9QwtfRpHyDqmdsBhd7EfYnO9UYz9hMt4kPbwjnRi
 d8H5AwwjLHCbrNL4YBIdRVzPJw+lZ3kjb5ucqxeL/5lQ0witwWdFtBT6l35MKFRkUp40
 tuG1UlnLTsmqM55IVTMnRAc/1xw+CUGxZZvLEU0VN+NZg6pP6glFhGbnpWKVDYWqBh8h
 hPDThNepc3YWeD8JgsNUj086mYuZ4b7qCtsmw0K+gwIPU3MqMrsnZeARt6VYJWpDzFR6
 NdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wl3SnVj1f++wA/odp8PFAGCD/Lp37+pyd/bNCjzE7ko=;
 b=33ybyPjLPC0jVYXGcEV93XjGoGUXu6G96yc4c387lWqxUyKiY6p67QHkj1hyzZaYXc
 ejXRjAd8cI0mWNrAA5ln63AxbLBLSH8Q+puHxLhLWbI1XNCnqEIeU86s4fi5mjL5yhtt
 uSS0Ise3JugLBpyiZ3ozzlIyccODW/D0gvUUFhUUsEs2Aat2uKf44UN428B11AER+ehT
 ORpiskurUTVbRvCLc8KZhXw3ZTqcgZOv4c2FRCf0tvxQMM3T6D/11fFOv1Sp6sxq/fRh
 2Q8SLZj8mzVUH6iIgNoqPlZOmGcMwu87XkPN1yoVLsPizRvNhfGNu+8lU221iUVRkA1w
 fhXg==
X-Gm-Message-State: AOAM531YS399Hf3m+w93fHiFqLbxbJ5ARiCrPTqxVxu873jnUjcNdkUn
 H0DOK2ZTNhI/q5MPA3jtMNs=
X-Google-Smtp-Source: ABdhPJxyd8HO12HzlNWzGeXzHVZyOll5U8Vg5AJJRQapiXx/LjGj+wL+sQo6b/0rLRjz5KWf/66auw==
X-Received: by 2002:a17:90a:aa91:b0:1b9:19d6:95b6 with SMTP id
 l17-20020a17090aaa9100b001b919d695b6mr18862157pjq.106.1645401570743; 
 Sun, 20 Feb 2022 15:59:30 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id a15sm15987017pgd.11.2022.02.20.15.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 15:59:29 -0800 (PST)
Date: Mon, 21 Feb 2022 08:59:27 +0900
From: Stafford Horne <shorne@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 4/6] hw/openrisc/openrisc_sim: Increase max_cpus to 4
Message-ID: <YhLV35HEfeAP55tE@antec>
References: <20220219064210.3145381-1-shorne@gmail.com>
 <20220219064210.3145381-5-shorne@gmail.com>
 <d97c3f6f-e155-b257-552e-eebd0d8d2169@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d97c3f6f-e155-b257-552e-eebd0d8d2169@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 20, 2022 at 09:07:17PM +0100, Philippe Mathieu-Daudé wrote:
> On 19/2/22 07:42, Stafford Horne wrote:
> > Now that we no longer have a limit of 2 CPUs due to fixing the
> > IRQ routing issues we can increase the max.  Here we increase
> > the limit to 4, we could go higher, but currently OMPIC has a
> > limit of 4, so we align with that.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   hw/openrisc/openrisc_sim.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thank you.

-Stafford

