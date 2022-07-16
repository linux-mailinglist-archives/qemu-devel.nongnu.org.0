Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE370576FE5
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 17:33:10 +0200 (CEST)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCjn3-0003ts-EK
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 11:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oCjlC-0002HS-CG
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 11:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oCjl7-00089b-T8
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 11:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657985468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwJ6qlB481p2jijaAkoGcNiZrHIn/72xsKaJkATVHwY=;
 b=KPVGWfzatJAU9dDNM5j6tA5ke3aTHm8tT/eaNfgav3eUTcJ6dx36EHx+Ddb77ooa2TQGPf
 SdHa6tU09AoNUcBewooW52oe5kejqrnK11U5q22pQtWfbZODi6kv/V0attgVr+uOtyCWMm
 AJQIXE5UOXjiAnxmukdwVAcj6pgo3ps=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-iHDcdtOlPP-pQMkENk7sIg-1; Sat, 16 Jul 2022 11:31:01 -0400
X-MC-Unique: iHDcdtOlPP-pQMkENk7sIg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t5-20020a056402524500b0043a923324b2so5383705edd.22
 for <qemu-devel@nongnu.org>; Sat, 16 Jul 2022 08:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zwJ6qlB481p2jijaAkoGcNiZrHIn/72xsKaJkATVHwY=;
 b=cKUeya5KnN61zQMHvHZ99Q5ZJe3oKA0KVqJdY9OKcPTVFUcU7ZYaMy47K8B8g8MhCI
 mSxMsl63nsqbjWbkOdXlMByS+zh41xroPmbUrJYXwQMeAkWzIZWtumuiZSgwwzXkrUxQ
 W+er7nwbqoshE4MZj4h3NuMmqXncx9O9ytfNbFmMfVoFO3XSLDKgIs2eeZkwgdVAEBND
 g7qYvwDiq9IhK+mxCRLv/t4rSApK/TsRDaTA3yjxUHEPq82YEYSTGmjFt/ANlimFzLCn
 +C9lpkpVy01AFoGv+NNQ7lMWuu+ZlmvdzafkZEptXY3BvSBOHRAgAHwd6niOlmPInitF
 Znqg==
X-Gm-Message-State: AJIora/2ChvLy/EHI1ZWe6GaEq2x2wDooMu4yjWqPmG5MWzmyzQYcx5v
 7I73GlunyFrWYd8nWgaRcjdNh7FmlGOckWge9U1+gm//gGQ28Mn7Yv1fDmACXNl6lggtoQ4DOsJ
 kIqzb/vkzwcovRLQ=
X-Received: by 2002:a05:6402:5212:b0:43a:ad74:b336 with SMTP id
 s18-20020a056402521200b0043aad74b336mr26304406edd.16.1657985459848; 
 Sat, 16 Jul 2022 08:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+V7fJSSGc8QeUFSTUFUSmqw023PQ8wGaOxVDfQNtO7fQbhnbQzmALT5X29Df7lFCbgN82Cw==
X-Received: by 2002:a05:6402:5212:b0:43a:ad74:b336 with SMTP id
 s18-20020a056402521200b0043aad74b336mr26304390edd.16.1657985459636; 
 Sat, 16 Jul 2022 08:30:59 -0700 (PDT)
Received: from redhat.com ([2.54.168.117]) by smtp.gmail.com with ESMTPSA id
 p14-20020aa7cc8e000000b00435651c4a01sm4882580edt.56.2022.07.16.08.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:30:59 -0700 (PDT)
Date: Sat, 16 Jul 2022 11:30:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: berrange@redhat.com, imammedo@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220716112943-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> 
> 
> On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
>     > > Instead of all this mess, can't we just spawn e.g. "git clone --depth
>     1"?
>     > > And if the directory exists I would fetch and checkout.
>     >
>     > There are two reasons I can think of why I do not like this idea:
>     >
>     > (a) a git clone of a whole directory would download all versions of the
>     > binary whereas we want only a specific version.
> 
>     You mention shallow clone yourself, and I used --depth 1 above.
> 
>     > Downloading a single file
>     > by shallow cloning or creating a git archive is overkill IMHO when a wget
>     > style retrieval works just fine.
> 
>     However, it does not provide for versioning, tagging etc so you have
>     to implement your own schema.
> 
> 
> Hmm I’m not sure if we need all that. Bits has its own versioning mechanism and
> I think all we need to do is maintain the same versioning logic and maintain
> binaries of different  versions. Do we really need the power of git/version
> control here? Dunno.

Well we need some schema. Given we are not using official bits releases
I don't think we can reuse theirs.

> 
> 
> 
> 
>     > (b) we may later move the binary archives to a ftp server or a google
>     > drive. git/version control mechanisms are not the best place to store
>     > binary blobs IMHO. In this case also, wget also works.
> 
>     surely neither ftp nor google drive are reasonable dependencies
>     for a free software project. But qemu does maintain an http server
>     already so that't a plus.
> 
> 
> 
>     I am not insisting on git, but I do not like it that security,
>     mirroring, caching, versioning all have to be hand rolled and then
>     figured out by users and maintainers. Who frankly have other things to
>     do besides learning yet another boutique configuration language.
> 
> 
> Yeah we do not want to reinvent the wheel all over again. 
> 
> 
> 
> 
>     And I worry that after a while we come up with a new organization schema
>     for the files, old ones are moved around and nothing relying on the URL
>     works.  git is kind of good in that it enforces the idea that history is
>     immutable.
> 
> 
> Ah I see your point here.
> 
> 
> 
> 
>     If not vanilla git can we find another utility we can reuse?
> 
>     git lfs? It seems to be supported by both github and gitlab though
>     bizarrely github has bandwidth limits on git lfs but apparently not on
>     vanilla git. Hosting on qemu.org will require maintaining a server
>     there though.
> 
> 
> 
>     All that said maybe we should just run with it as it is, just so we get
>     *something* in the door, and then worry about getting the storage side
>     straight before making this test a requirement for all acpi developers.
> 
> 
> 
> 
> 


