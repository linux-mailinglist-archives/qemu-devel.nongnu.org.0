Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F81231A05D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:11:59 +0100 (CET)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZAs-0003kC-19
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAZ99-0002iW-Lu
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:10:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAZ96-0005OH-Lp
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613139007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FeYD/uMkY8Vy50VNvhIs85koJS7aCNVPV48SG1SCId4=;
 b=MoWWmvGoOg53ByiNF+oy5PQtl/bJw1JVO03xrUPbz2msjihoK3pmt8CGAJORcIX7qG4fwJ
 2qbvw3bUS10h5xGfYT9h0X4CYgey30exkVhGPBJ/2XbTxLqNxiM6xRyLsTV8MPUescOn3a
 Af7Hjf1GzNQdjsACVVZqnfz3OfDlhHc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-vUVYedddMdypEVUi35wX2w-1; Fri, 12 Feb 2021 09:10:04 -0500
X-MC-Unique: vUVYedddMdypEVUi35wX2w-1
Received: by mail-wr1-f69.google.com with SMTP id e12so370007wrw.14
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 06:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FeYD/uMkY8Vy50VNvhIs85koJS7aCNVPV48SG1SCId4=;
 b=qrwSAo/4m9hz/IlBdKywixEMb16YDx73/fxGoahlfx4DIvMRuGyRw1VdJbgyjDGhpO
 1fRF9GiwTGvJhw2U6yUTFHOwFVPqpoGW9O6Nc8tHehfWiJDJityx7AkUCcxbL0Dg7j/q
 48ChIjyv9eChtgTPkINZty73EYXxU8mWQe5XL9MIueJWNpKLLyFJaYQ10lVIpjncsDbw
 UI6w5DL1HlQjYPLkxr78f3fT22o93VO93fLqMS7QbRknYYiXuhh6ilngHgJOW7b2qkc2
 XGePvlFdoRmA4F23g8knO6BmdQjQg2+/c0v/wgbF3+2CpzQuolCBC67K8CBNpbWCqmwK
 o1Cw==
X-Gm-Message-State: AOAM532ICW50eIEgaITKR/Ki03tRaE2JfR4pb2LLNHDUBqH6hek8JRAA
 J3XqAMoLg7JdcGjMdPEn2184skkUZRIYEiORtSxC+33Itdyb0Dxx/jZsQvnicl8hRQWKLUpwfo5
 PJz83HTjWWsCi4Fk=
X-Received: by 2002:a1c:7910:: with SMTP id l16mr2898294wme.34.1613139002991; 
 Fri, 12 Feb 2021 06:10:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCPx44SfnGOT+xpEA4ectQpZaBIJIsndhq490F0dqz4SrtFm2w2KlSZxLbTEJ03lEcRsWr4A==
X-Received: by 2002:a1c:7910:: with SMTP id l16mr2898260wme.34.1613139002702; 
 Fri, 12 Feb 2021 06:10:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t30sm6755745wra.56.2021.02.12.06.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 06:10:02 -0800 (PST)
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
Date: Fri, 12 Feb 2021 15:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211220055.19047-1-nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 b.galvani@gmail.com, qemu-arm@nongnu.org, Pavel.Dovgaluk@ispras.ru,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Niek and QEMU community,

On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> The following are maintenance patches for the Allwinner H3. The first patch
> is a proposal to relocate the binary artifacts of the acceptance tests away
> from the apt.armbian.com domain. In the past we had problems with artifacts being
> removed, and now the recently added Armbian 20.08.1 image has been removed as well:
> 
> $ wget https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> Connecting to dl.armbian.com (dl.armbian.com)|2605:7900:20::5|:443... connected.
> ...
> HTTP request sent, awaiting response... 404 Not Found
> 2021-02-11 22:34:45 ERROR 404: Not Found.
> 
> I've now added the artifacts to a server maintained by me. The machine has a stable
> uptime of several years, ~100Mbit bandwidth and plenty of available storage.
> Also for other artifacts if needed. I'm open to discuss if there is a proposal
> for a better location for these artifacts or a more generic qemu location.

Thanks for trying to fix this long standing problem.

While this works in your case, this doesn't scale to the community,
as not all contributors have access to such hardware and bandwidth /
storage.

While your first patch is useful in showing where the artifacts are
stored doesn't matter - as long as we use cryptographic hashes - I
think it is a step in the wrong direction, so I am not keen on
accepting it.

My personal view is that any contributor should have the same
possibilities to add tests to the project. Now I am also open to
discuss with the others :) I might be proven wrong, and it could
be better to rely on good willing contributors rather than having
nothing useful at all.

Regards,

Phil.


