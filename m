Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741454D2C16
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:34:22 +0100 (CET)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRsi5-0000zM-Iz
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:34:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRsfu-0000Ey-ER
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:32:06 -0500
Received: from [2607:f8b0:4864:20::1029] (port=42756
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRsfs-0006qj-Sl
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:32:06 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso1808459pjq.1
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 01:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bHqgVFmlvdtu8p/2NaTP/EWLOtwummC6bATsDi4mBTY=;
 b=U5aWxtT4h3iAX9cN3vQbqqfIL/DSYOJHgrT0r24iJ6TqW9aJywf4mhUxRaZ60eW2M/
 6oWxbsuSJh0Dfx9mtWIPOAhaGiGAu7CSSJwWmct88IQzb5MQogMh7m/jtksvdp3fhD6w
 t4ptMafyCTu8g76KL6yeGguiMSH5uEVG3RIRaq1aa0eVYibPMamR0N5cHjQ6lv+5M0x5
 3lTZqhRHnwRY8IjfuH+O2kWmE2ncbBNbrCUOdy6f+qakvjS/TOh7eabZil0xp9uPJ8ih
 7ea9G5Cvsrq0eHso+X+2c/b6vtenzW2LUO5IwwPahnxj67tbBZbtfLOaHztWIX9ERqjX
 uyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bHqgVFmlvdtu8p/2NaTP/EWLOtwummC6bATsDi4mBTY=;
 b=7P1Ivq2+Jf2gpPPI5uijBwVuWc6nKxNVI/IiuAeP3YfqaEKKsY5WnZEnZ0lIvEVmR7
 /2xkfg9+VbjD/5BDzJkwofCEPEA42s5zGLVBaaVSlmZHnJW01/JFk7+c7Tn0C6R3Dtvb
 Eoyz4KMIzm6lAku1sQ9W2mKfzvg7Li8rfo0M2kuFpLdZf8sKJ3OE+qddrVXpX0ndaQFX
 z24mk7l6c6BwYF0WgGEjuFreNJth7+vzjnaH/bkUMhjhGW+h9v+/keGzbQ+PNqz+xxgk
 TjlptqQuwRSDP6Z6gjc7qftNDOxef6xupkCgJYDpkMoxppIu+n4WCMd4OQqHTb+ClvpH
 9Z6Q==
X-Gm-Message-State: AOAM533lUr2DGF5MExdRdf0uZWkLrjtXkxTl70iFOQDi4UQXeFt16hCG
 3m3s9Ylj/uA70lYpedZ9H7U=
X-Google-Smtp-Source: ABdhPJz0d2Ra2038CgJi9EjIeH5YZBYwxi6IRbK4O3V4I5bD65cq3Z1SqfWjnUaSDMNSCmkS4mLKaA==
X-Received: by 2002:a17:90b:3b46:b0:1bf:b1f:588f with SMTP id
 ot6-20020a17090b3b4600b001bf0b1f588fmr9399504pjb.182.1646818323477; 
 Wed, 09 Mar 2022 01:32:03 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090ac40200b001bd0e552d27sm1844491pjt.11.2022.03.09.01.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 01:32:02 -0800 (PST)
Message-ID: <5986332a-1f9c-01bf-e3e7-329cf2d04672@gmail.com>
Date: Wed, 9 Mar 2022 18:32:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
 <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/09 18:26, Gerd Hoffmann wrote:
>    Hi,
>   
>> dpy_gfx_switch and dpy_gfx_update need to be called to finish the
>> initialization or switching of the non-OpenGL display. However, the proposed
>> patch only calls dpy_gfx_switch.
>>
>> vnc actually does not need dpy_gfx_update because the vnc implementation of
>> dpy_gfx_switch implicitly does the work for dpy_gfx_update, but the model of
>> ui/console expects the two of dpy_gfx_switch and dpy_gfx_update is separated
>> and only calling dpy_gfx_switch violates the model. dpy_gfx_update used to
>> be called even in such a case before and it is a regression.
> 
> Well, no, the ->dpy_gfx_switch() callback is supposed to do everything
> needed to bring the new surface to the screen.  vnc isn't alone here,
> gtk for example does the same (see gd_switch()).
> 
> Yes, typically this is roughly the same an explicit dpy_gfx_update call
> would do.  So this could be changed if it helps making the opengl code
> paths less confusing, but that should be a separate patch series and
> separate discussion.
> 
> take care,
>    Gerd
> 

Then ui/cocoa is probably wrong. I don't think it does the update when 
dpy_gfx_switch is called.

Please tell me if you think dpy_gfx_switch shouldn't do the implicit 
update in the future. I'll write a patch to do the update in cocoa's 
dpy_gfx_switch implementation otherwise.

Regards,
Akihiko Odaki

