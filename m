Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F95F7B1A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:58:20 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpjv-0001yE-RR
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogorV-0008LR-6q
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:02:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogorT-0002iL-Dq
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:02:04 -0400
Received: by mail-pf1-x434.google.com with SMTP id h13so3699402pfr.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0uGfsPyGQsPISCxDb2YPq9GB2lrmlEtodwpH10AwoQ=;
 b=v3JsEyUZW5RRdTZP3C0Tcz7JrzDj+9rdpNJ/kh0Kcp9RCdIZMfIvXHVFHRUdo7E7Q9
 /MuJR/vE7TuT9y3jDqPxaUUtUFRvODeKejF+Hf1iRlic5EeKQqzPRWduLhnH6/xp6MGv
 nj5GtMME5JVSuEKQF679CKPS0X58ir4KJ6dNiOIOeLXLj4GqQlyDExqWj7xw0JSCGt1o
 82umAJTFMg4WcDX40pIs7YruTIGrhLjDBV8kiYj587nwG8qH1TIHwg8G0A2v7oPfxVLz
 RFk4YtsLsa8hJABZXKElJEX0AXpO+Fk4hUgGGkhtTqwxU1pMAXuDa4SUiI9PKhzt2cBs
 ERiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0uGfsPyGQsPISCxDb2YPq9GB2lrmlEtodwpH10AwoQ=;
 b=Wxcs/0TMcCJ90REY/zO1ABvVEsAdtyaRaCv4BJ3q6uRKrEBlH90p09RgzDnCbgE9bt
 WY2yE0thaZN0t9yDsbwDtpoqHj/4bcGnMRlfLOK6thzMIF/+TTOJw9YILjKb4kem9AmR
 dX5tjtucfOn7ybXVsaoXu4YRbwufpgdUMIWHhoeboeVj4m4Iqa0DyqZwTjZUwHQfC/ez
 C2BoPXVWBU6Owvm0JtNKt5QgJOWgi4hhROJVG21396ChqHYiYyo1FTlqjoXYyA9Q8u0N
 /j6Clg/9HJsFHzFXu4KQtmgPwP54UCLh/dRxVsEXoP1RJPd6h4tv7/0+J2DS4NWS7LUo
 mp1w==
X-Gm-Message-State: ACrzQf3U9egHeAgB2wMLRsSQpn0xPm3IuV1/7vf5Bl8nfOYSXHIWrMIL
 2Y0qRnCjXH9JcduAutyKE40FpQ==
X-Google-Smtp-Source: AMsMyM6+SKNvodce3BpF8R4eLQcRFxh3ySVeKLbVv9jA//cHoaGknfn6p/2JfnaNACkLUn83kz/9fA==
X-Received: by 2002:a05:6a00:2350:b0:541:b5bf:2774 with SMTP id
 j16-20020a056a00235000b00541b5bf2774mr5704263pfj.28.1665154920917; 
 Fri, 07 Oct 2022 08:02:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 24-20020a630d58000000b0045ccc30e469sm1756231pgn.25.2022.10.07.08.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 08:01:59 -0700 (PDT)
Message-ID: <d540cccc-ec17-6fc2-f4c6-4905074e2d00@linaro.org>
Date: Fri, 7 Oct 2022 08:01:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] win32: set threads name
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
 <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
 <CAMxuvazZYUw1LHSv_kg1gBWmGePOXXz1w6nX7MnYwA-GbaK33w@mail.gmail.com>
 <CAJ+F1CK4jqCw-QOEdCT0yVRb7eMY9O1+C7fZfY_JHG9CsdM_kw@mail.gmail.com>
 <a810c149-7b4c-c289-e32a-c7b205705b0b@linaro.org>
 <CAJ+F1CJ=FmFVNp1_DE9mg0r0duNBjHo5m2P3k3t4zRuSuV-w_g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJ+F1CJ=FmFVNp1_DE9mg0r0duNBjHo5m2P3k3t4zRuSuV-w_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/7/22 02:52, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Oct 7, 2022 at 1:04 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 10/6/22 05:51, Marc-André Lureau wrote:
>      > Hi Richard
>      >
>      > On Mon, Oct 3, 2022 at 11:39 AM Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>
>      > <mailto:marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>>> wrote:
>      >
>      >     Hi
>      >
>      >     On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson
>      >     <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>
>     <mailto:richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>>> wrote:
>      >      >
>      >      > On 9/30/22 07:03, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> <mailto:marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>      >     wrote:
>      >      > > +static bool
>      >      > > +set_thread_description(HANDLE h, const char *name)
>      >      > > +{
>      >      > > +  HRESULT hr;
>      >      > > +  g_autofree wchar_t *namew = NULL;
>      >      > > +
>      >      > > +  if (!load_set_thread_description()) {
>      >      > > +      return false;
>      >      > > +  }
>      >      >
>      >      > I don't understand why you're retaining this.
>      >      > What is your logic?
>      >      >
>      >
>      >     Also, if we change the "static bool name_threads" to be true by
>      >     default, then set_thread_description() might be called without calling
>      >     qemu_thread_naming()
>      >
>      >     It really shouldn't hurt to keep it that way.
>      >
>      >
>      >
>      > Let me know if the current form is ok for you, thanks
> 
>     I guess it's ok, sure.
> 
> 
> Should I take that for an Ack?  :)

Yes, that was sloppy.
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

