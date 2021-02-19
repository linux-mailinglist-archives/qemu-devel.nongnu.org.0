Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D085A31FEC7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:26:42 +0100 (CET)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDAUD-00030F-L0
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDARo-00024T-RV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDARk-0001g3-Cm
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613759047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2uFgV2BmmAQeV0YgKzt3/vyJSjl0E7vZmtWpAFx1Rg=;
 b=XEf0EM/nvm5yHqt53Ex8HQgJqlsayIZIj5veDYiee7rp6KrAiT6BAMZIqjPONgDRFajHNz
 3V7KtGxglYW7jyydSosvSygI7L2QbFwYPP7ht5mW92LR875nJhleGZqBSoapvPMCTHVfFb
 pUlhmZGYerljH+zMoeS99SvstVOSYC8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-pdPZlVz4NjyDKM3T1a2LjA-1; Fri, 19 Feb 2021 13:24:04 -0500
X-MC-Unique: pdPZlVz4NjyDKM3T1a2LjA-1
Received: by mail-wm1-f70.google.com with SMTP id q24so2867024wmc.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 10:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2uFgV2BmmAQeV0YgKzt3/vyJSjl0E7vZmtWpAFx1Rg=;
 b=VrR/4HyDijToZbbYZb4piVW60zbAX7qdzxMgCqfRpVBAFC6hziV53jJIVST8tN7IWY
 rYQh9weYzrSEijIa03Xn5QTErpEMtpP5zY2vJOG4LWdcTzucbR9zJz3zV5BtXRKytL5C
 qFl9sdnO8RRp80qr7zshl18j+C7h+VSDIPyoAEfkzfcV4ZQ43BGkoz6wbMC3Ld8YpaeK
 uKSoda1Rmi7dm4K6TyonQcvE5OM2QW7FWVII/5Ct+KDndfQ3nftDNF5xlKRGCL+uqoxx
 h2nEk6DmJLC3qcHhA/nL2NH0WGvKhPTHxmyZ9jHyScl6sDQUd1cBa4P7NwX6JB3loig4
 rW1w==
X-Gm-Message-State: AOAM533O6o0oRaVR7aYTszuso6xWVFpDDbW/fb+ENHWDXTK7ei0sb9Gb
 OwzP67zjEG9p9fsa2d9zpQ1CyuJuxpxgx0KeNSCbFj68pL+R0n5N4UHWZiT5fOVKPwAY4zjtdPA
 I1RG2T30wRJ+7HWw=
X-Received: by 2002:a7b:c353:: with SMTP id l19mr9506584wmj.147.1613759043326; 
 Fri, 19 Feb 2021 10:24:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvZPTMYfF2dVovIS7xpCbfbL2EXfY16hjnikVSfVnYYQ5rYKo39e09dRk+evTVlMWxnk7G6Q==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr9506558wmj.147.1613759042878; 
 Fri, 19 Feb 2021 10:24:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t30sm15359550wra.56.2021.02.19.10.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 10:24:02 -0800 (PST)
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
 <YCuVC4T+TFjuskhF@redhat.com>
 <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
Date: Fri, 19 Feb 2021 19:24:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Pavel.Dovgaluk@ispras.ru, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, crosa@redhat.com,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Niek,

On 2/17/21 9:57 PM, Niek Linnenbank wrote:
> Hi Daniel, Philippe,
> 
> Op di 16 feb. 2021 10:49 schreef Daniel P. Berrangé <berrange@redhat.com
> <mailto:berrange@redhat.com>>:
> 
>     On Fri, Feb 12, 2021 at 03:10:00PM +0100, Philippe Mathieu-Daudé wrote:
>     > Hi Niek and QEMU community,
>     >
>     > On 2/11/21 11:00 PM, Niek Linnenbank wrote:
>     > > The following are maintenance patches for the Allwinner H3. The
>     first patch
>     > > is a proposal to relocate the binary artifacts of the acceptance
>     tests away
>     > > from the apt.armbian.com <http://apt.armbian.com> domain. In the
>     past we had problems with artifacts being
>     > > removed, and now the recently added Armbian 20.08.1 image has
>     been removed as well:
>     > >
>     > > $ wget
>     https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>     <https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz>
>     > > Connecting to dl.armbian.com <http://dl.armbian.com>
>     (dl.armbian.com <http://dl.armbian.com>)|2605:7900:20::5|:443...
>     connected.
>     > > ...
>     > > HTTP request sent, awaiting response... 404 Not Found
>     > > 2021-02-11 22:34:45 ERROR 404: Not Found.
>     > >
>     > > I've now added the artifacts to a server maintained by me. The
>     machine has a stable
>     > > uptime of several years, ~100Mbit bandwidth and plenty of
>     available storage.
>     > > Also for other artifacts if needed. I'm open to discuss if there
>     is a proposal
>     > > for a better location for these artifacts or a more generic qemu
>     location.
>     >
>     > Thanks for trying to fix this long standing problem.
>     >
>     > While this works in your case, this doesn't scale to the community,
>     > as not all contributors have access to such hardware and bandwidth /
>     > storage.
>     >
>     > While your first patch is useful in showing where the artifacts are
>     > stored doesn't matter - as long as we use cryptographic hashes - I
>     > think it is a step in the wrong direction, so I am not keen on
>     > accepting it.
>     >
>     > My personal view is that any contributor should have the same
>     > possibilities to add tests to the project. Now I am also open to
>     > discuss with the others :) I might be proven wrong, and it could
>     > be better to rely on good willing contributors rather than having
>     > nothing useful at all.
> 
>     There aren't many options here
> 
>      1. Rely on a vendor to provide stable download URLs for images
> 
>      2. QEMU host all images we use in testing
> 
>      3. Contributor finds some site to upload images to
> 
> 
>     For the armbian images we rely on (1), but the URLs didn't turn out
>     to be
>     stable. In fact no OS vendor seems to have guaranteed stable URLs
>     forever,
>     regardless of distro, though most eventually do have an archive site
>     that
>     has good life. Armbian was an exception in this respect IIUC.
> 
>     (2) would solve the long term stability problem as QEMU would be in full
>     control, and could open it up for any images we need. The big challenge
>     there is that QEMU now owns the license compliance problem. Merely
>     uploading
>     binary images/packages without the corresponding source is generally
>     a license
>     violation. QEMU could provide hosting, but we need to be clear about
>     the fact
>     that we now own the license compliance problem ourselves. Many sites
>     hosting
>     images simply ignore this problem, but that doesn't make it right.
> 
> 
>     This series is proposing (3), with a site the contributor happens to
>     control
>     themselves, but using a free 3rd party hosting site is no different
>     really.
>     Again there is a the same need for license compliance, but it is now the
>     responsibility of the user, not QEMU project.
> 
>     In this http://www.freenos.org/pub/qemu/cubieboard/
>     <http://www.freenos.org/pub/qemu/cubieboard/> site I can't even see a
>     directory listing, so even if corresponding source does exist in
>     this server,
>     I can't find it.
> 
>     The isn't really a problem for QEMU CI to consume the images, but as
>     a free
>     software developer I don't like encouraging practices that are not
>     compliant
>     with licensing reuqirement.
> 
>     It is an open question whether the (3) is really better than (1) in
>     terms
>     of URL stability long term, especially if running off a user's personal
>     server.
> 
> 
> I understand your concerns. My goal here was to be able to re-activate
> the orangepi tests, so we can capture bugs early on.

I hope you understand the concern I have is not with you in particular,
and I used your case to start a discussion with the QEMU community.

FWIW I missed the URL change because I still have the image cached in
Avocado so my testing ran fine. Which makes me wonder...

Cleber, Willian, should Avocado display information about cached
artifacts? Such "Using artifact downloaded 7 months ago".

> So what I can do
> instead is:
> 
>   - update the patch to use github to store the artifacts, and their
> licenses (other tests also use github)

Until there is better solutions, this is the option I prefer.

>   - or change the patch to use updated armbian links that work (for now)
> 
> If we can agree on either of these solutions, so the orangepi tests can
> be re-activated, that would be great. 
> 
> Kind regards,
> Niek


