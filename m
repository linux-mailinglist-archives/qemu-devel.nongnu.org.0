Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AE6DDDF7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:31:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmF1E-0007ih-DJ; Tue, 11 Apr 2023 10:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmF19-0007iY-Dw
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:30:43 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmF17-0001ri-EW
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:30:43 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50489cb73c3so2298477a12.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681223439; x=1683815439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=me4POHSOlJjZzOjjlR99NOyEOKXhInUvjqMvnQ5lCfI=;
 b=TMFKfF89eyCzJqVJx/57f2a6zCYO6Q5CrzaH3Jm1R/zruvqoOJo8dLPFibE3hzO23c
 rphej6xSJ+qG0IqsSRsw28J0RXo90o3kpNfC7NZONrjL4Zn3/88Kt9EJ1ms95fsIbpYJ
 jRvDILJiL4qGVEv9u/LaDl5TvZQ9etq6b/keHW68zVnoZkIW+afAfLh2nksiyHSA73WV
 XJcONpqo/9YkgDt0hvvi9HgVgfQRl2zfFC05WWMiTsm0hV6E7gr+1HR5V3FnMKa9ExlH
 hJlnjJqRcDKs1bftjtDF7kh5P/Ab4mrLRNNmambaxMmn8xEhpU1UvT0aRpZ9Db8+ikCJ
 4GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223439; x=1683815439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=me4POHSOlJjZzOjjlR99NOyEOKXhInUvjqMvnQ5lCfI=;
 b=GAQwZJbPXqc8Cje0LQ5W8UCMRx0VPmjUKCAYkL4UeZS0v3Z3iClmY66TUlfmXASiDw
 qcXPnGkxetzeCYzNb/eikYuYNO+leyYDrzirJP2FOwvWvLQ6NajAG6AnJg6hoPixqSxT
 nwD/iUHQX7bahlAWJD+IM3AH42prwAp5ouKvuJgv5/vaRQHfljThUZZ9M9lSX+WTWsqB
 Jjw6Zrh+qnW4ScAd03RtFKzp/E0Nz47X4w4txYh0fXIilPsgaGuYvF27cUMsu6EJKL1Q
 hIrHVkBZRwq0R4V/1CdhXXEPj/gIdDi6VeYapgdd5vi+AofS4u2QFvvWES6zDJkSH+uN
 rCHg==
X-Gm-Message-State: AAQBX9eJvmWiiVQXPI8Ah2bir9b1sBMyUxKoscGL+2j9f4Do+XaJ9Ppy
 R9ZKfMil0Rg/NlfawXyfkc1mwBxcl0yQ0FJyLwqICQ==
X-Google-Smtp-Source: AKy350buQMqrc9iB2HWx9QFogMVL0vec6XRxWQmeS9X5xWDS21OK2qmu28x41Dyi96h2TwtLWs6Cax7rrftpOZsMd9g=
X-Received: by 2002:a50:9ecd:0:b0:504:6ff7:658b with SMTP id
 a71-20020a509ecd000000b005046ff7658bmr6777404edf.6.1681223439562; Tue, 11 Apr
 2023 07:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230410033208.54663-1-jasowang@redhat.com> <ZDVrSVW0FoEuq6+2@x1n>
In-Reply-To: <ZDVrSVW0FoEuq6+2@x1n>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 15:30:08 +0100
Message-ID: <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
To: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 11 Apr 2023 at 15:14, Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Apr 10, 2023 at 11:32:08AM +0800, Jason Wang wrote:
> > @@ -222,9 +222,9 @@ static guint vtd_iotlb_hash(gconstpointer v)
> >  {
> >      const struct vtd_iotlb_key *key = v;
> >
> > -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
> > -           (key->level) << VTD_IOTLB_LVL_SHIFT |
> > -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> > +    return key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SID_SHIFT) |
> > +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
> > +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
> >  }

> >  /* The shift of source_id in the key of IOTLB hash table */
> > -#define VTD_IOTLB_SID_SHIFT         20
> > -#define VTD_IOTLB_LVL_SHIFT         28
> > -#define VTD_IOTLB_PASID_SHIFT       30
> > +#define VTD_IOTLB_SID_SHIFT         26
> > +#define VTD_IOTLB_LVL_SHIFT         42
> > +#define VTD_IOTLB_PASID_SHIFT       44
>
> This is for the hash function only, IIUC it means anything over
> sizeof(guint) will be ignored and not contributing anything to the hash
> value being generated due to the uint64->guint conversion.
>
> IOW, I think "level" and "pasid" will just be ignored.

Whoops, hadn't noticed that guint type... (glib's
g_int64_hash()'s approach to this is to XOR the top
32 bits with the bottom 32 bits to produce the 32-bit
hash value.)

Also, does anybody know what the requirements are on
consistency between the hash_func and the key_equal_func
for a GHashTable ? Is the hash_func supposed to return the
same hash for every key that compares equal under key_equal_func ?

thanks
-- PMM

