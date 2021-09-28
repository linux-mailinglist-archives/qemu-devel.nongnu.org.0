Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082941B2DE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 17:21:40 +0200 (CEST)
Received: from localhost ([::1]:43438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVEvI-0001lT-Uw
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVEt4-0000bE-MO
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVEt0-0000tW-SW
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632842354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZvFNCAaWrrPZ3qbj8+tr9zPYVn9Kw58LbexKHNwIPY=;
 b=MazoJhxUeubobs3k0UrKkulry70YX22viL1Bo9qJa1v5Kypn8ie5z/FJQd6qX1gNUlSzgI
 +VF72Qp4h2j0sWV9zaYzZRnXFKavvZOtKvDY9uTggePpi9gc2CJE3nECtyG6Akd1JPfNu+
 hHi+Nl8zNDPkBuNeQ+/mXwlaHwvzsaU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-sV-XVtY_NTOcYS0IFeYPmg-1; Tue, 28 Sep 2021 11:19:12 -0400
X-MC-Unique: sV-XVtY_NTOcYS0IFeYPmg-1
Received: by mail-ed1-f71.google.com with SMTP id
 h15-20020aa7de0f000000b003d02f9592d6so22124653edv.17
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 08:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NZvFNCAaWrrPZ3qbj8+tr9zPYVn9Kw58LbexKHNwIPY=;
 b=lW+Ule9bF2zpJncDDoE0KquPYNtOHmpXHAC3mwCWf5drIuxSSLP1MlyKj2rM7mEUw4
 CjufDw7cVcgHpubYKbM+RoG5hbWgbeCyTuuuIH0Ck7ACwAaX/N71BFvI8lSh2yY5h1gc
 YwaQBmbClaGoP64f/2b5xzt08qd2OabMzzO/cpomvIp+dZkOMZNtuTPWEAWF9z65h1du
 9NZ17aoH8WKEYhjh3fdWvD0KLPhUhZuuc+YgzODnTbuzL8V2C7pmXt/ZJyYA+54mnNfR
 vZNvWheT9V/C195zeRk1iX5ykVfRCswZYOwDxG6iYB3Bf1GEAmo4QjG+PFeMykGRed77
 GxLQ==
X-Gm-Message-State: AOAM532U56a09SCp9cSaZYpUEw390Ept3Aoy2iN2ginVstGclnXHQS/G
 xyk7U7NOX7ZYh0iEa6O+UEezUbg9k4Z459DoIeP+DHuvrPyvTsWUSnsI2tI4qKFyoYSWCykfgFw
 m9LEV5MCou3/m1A4=
X-Received: by 2002:a17:906:3395:: with SMTP id
 v21mr7674335eja.210.1632842351619; 
 Tue, 28 Sep 2021 08:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzteazEvtRsSZ0l9gi1/2GKbsWpaI8kt34oV0IC2uB6Tgx/haBzam7UKbT0iNcDJ7RTfpQjuA==
X-Received: by 2002:a17:906:3395:: with SMTP id
 v21mr7674312eja.210.1632842351403; 
 Tue, 28 Sep 2021 08:19:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o3sm10591999eju.123.2021.09.28.08.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 08:19:10 -0700 (PDT)
Message-ID: <f0c83df1-c848-e4a9-723e-3397a50ec5d3@redhat.com>
Date: Tue, 28 Sep 2021 17:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: QAPI sync meeting
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/21 18:55, John Snow wrote:
> Hiya,
> 
> I'd like to propose that at least the three of us arrange a time to have 
> a meeting where we discuss our plans and ideas for QAPI going forward, 
> including rust, python, and golang extensions to the QAPI generator, 
> what we hope to accomplish with those projects, and so on.
> 
> What I am hoping to get out of this for myself is a high-level overview 
> of people's plans for QAPI and to produce some notes on those plans so 
> that I can have a reference that we've all acknowledged as roughly 
> accurate to be able to keep the community's design goals for QAPI in 
> mind as I continue my own development. Ultimately, I'd like some kind of 
> rough draft of a "QAPI roadmap".
> 
> I know there was a rust meetup during KVM Forum, but I was unable to 
> attend due to the timing. I'd like to expand the focus a little more 
> broadly to QAPI in general and discuss our "personal" roadmaps, goals, 
> queued work, etc so that we can collaboratively formulate a broader 
> vision of our work.
> 
> I'm posting to qemu-devel in case anyone else has an interest in this 
> area and would like to eavesdrop or share opinions, but we should 
> probably come up with an agenda first. So:
> 
> Proposed agenda:
> 
> Current projects, wishlists, and goals for QAPI:
> - Markus (~10 min)
> - Marc-Andre (~10 min) (Rust, dbus, etc?)
> - jsnow (~10 min) (Python, golang, etc)

I would be interested in attending too.

Paolo


