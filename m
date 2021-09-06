Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212C7401B6E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:49:56 +0200 (CEST)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNE4R-0007WQ-3I
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNE2R-0005IL-2y
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNE2P-0004Uw-DJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630932468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bu9mU0DECscLskG8hJfFBA7LaFncmEBJty0KOs7RdKM=;
 b=Jw3T6XgSjJ/msHeRR8H4B1Q18l6lkmfcwqHPRLXXi2Vh1WKklPCikPa13C8IN7LyDghGVV
 VxY8M7J5hR3M8QETC6NQ4Y+2BzjnQd9Y7DtBDvmunHurKH27UZTB6mKB9sZBQcBinkbjXY
 oIq0BAZDweSKiJNQ+NAVHkxawt1VaEk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-bFjRVNKqN3uJJwhZpZNVMw-1; Mon, 06 Sep 2021 08:47:45 -0400
X-MC-Unique: bFjRVNKqN3uJJwhZpZNVMw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so2296238wmc.9
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bu9mU0DECscLskG8hJfFBA7LaFncmEBJty0KOs7RdKM=;
 b=Z9QcNsZ39vm8i9UlQhd8cfOxA74lMi9WH7pqtIV1XLOqpCyyCO0oJaz/kdkmOYHYd0
 yDGLzl5C6okI8/1xZXH+L4M0X8hKDvvM+g3DB0U8vAlYdikAF3TvlkGV6hfA8ijN2CTU
 /uLWVtR3GsLsBLP2go/cvlbr8E1b/sdpEAqoPFhpZAJz/Xy4FXO1XZLPJ7CqL2V6M/Os
 IlhW64Kr0blVlmLrvuQf9Hg4cB5eSGjWfp3AKmyf34/94vtlFUNYVuVTouFKrk7V+Rf2
 VbOLvkU+/NyTa78HwagmnNpMTpxdI1l9Nt5GnyaRoZN/pt9txCxHwksdzby61reW90CP
 oR0A==
X-Gm-Message-State: AOAM531mTjp5pIxtX23tliS6yaXUW5/CGmjrmUPjiVn1aZV20+K5kcu+
 W/tuPYPAup5g6XDayTlgpEPmbiIsHtFTx5YVsjbXnKRskpXvFMfLrtCr/AOYquT5vC4V+HAToGz
 5Ys0IhOsHgo6SevE=
X-Received: by 2002:a05:600c:3213:: with SMTP id
 r19mr11330237wmp.11.1630932464627; 
 Mon, 06 Sep 2021 05:47:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV+SbqbhO7VpCP86Uh5M1Ak9Etj+huB9TCtpOqx9Rj5o6nZAvyJdwm7/wYgFcLVK7w91XY2g==
X-Received: by 2002:a05:600c:3213:: with SMTP id
 r19mr11330211wmp.11.1630932464341; 
 Mon, 06 Sep 2021 05:47:44 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id i5sm7755672wrc.86.2021.09.06.05.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:47:43 -0700 (PDT)
Subject: Re: configure / meson: Move the GBM handling to meson.build
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210906112945.88042-1-thuth@redhat.com>
 <20210906112945.88042-2-thuth@redhat.com>
 <CAFEAcA_kZp64PedHb_fFtbtTpV3RrRHaZC9qALZSXHB3+jh+eQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e1db517b-5040-7549-5656-90450b98da2d@redhat.com>
Date: Mon, 6 Sep 2021 14:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kZp64PedHb_fFtbtTpV3RrRHaZC9qALZSXHB3+jh+eQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/2021 13.37, Peter Maydell wrote:
> On Mon, 6 Sept 2021 at 12:30, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The GBM library detection does not need to be in the configure script,
>> since it does not have any user-facing options (there are no
>> --enable-gbm or --disable-gbm switches). Let's move it to meson.build
>> instead, so we don't have to clutter config-host.mak with the related
>> switches.
>>
>> Additionally, only check for GBM if it is really required, i.e. if we
>> either compile with OpenGL or with virglrenderer support.
>>
>> Message-Id: <20210714085045.797168-1-thuth@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I assume this doesn't change behaviour here,

Right.

> so this is more of
> a maybe-followup-improvement note, but the gbm checking (in the
> old configure version) recently confused somebody on qemu-discuss:
> https://lists.nongnu.org/archive/html/qemu-discuss/2021-09/msg00010.html
> They didn't have libgbm installed, and because there's no
> --enable-gbm there's no way to force configure to enable the egl-headless
> UI frontend -- it is always silently falls back to "don't build that".
> Ideally we ought to provide a means for distros and users to say
> "make sure you build this feature or barf" the way we do with other
> things, I guess.

Marc-André, you've introduced the GBM library in commit d52c454aa as far as 
I can see ... could you please comment on this? Was there a reason not to 
add --enable-gbm and --disable-gbm switches?

  Thomas


