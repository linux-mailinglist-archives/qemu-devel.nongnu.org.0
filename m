Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168872E8E69
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:25:42 +0100 (CET)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAse-0000fC-M8
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwAor-000638-Pc
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 16:21:46 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:51292 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwAop-0007K8-4A
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 16:21:45 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 27F7A41281;
 Sun,  3 Jan 2021 21:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1609708899;
 x=1611523300; bh=JKgE80RPRGZLtWvlZAJvi74fnoirFOan07jWJSWLepQ=; b=
 dR49BQTOLFqVrGK19Eshdn66WDbPECNBY9KX5nCSaXYh3pHLMmuK34zZ1hDDm9M8
 kW6EaZDyAUm1k7oLmZ1jnb55Sp18I8E+unvizgq6zMm/vMMSg4dQZuZ2pvu0Q936
 wsLc3p+evEFkOUiH/IOGf96entkBVQOoYpnv2/eQXgA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmNk0p-IbJ01; Mon,  4 Jan 2021 00:21:39 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CC43441253;
 Mon,  4 Jan 2021 00:21:39 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 4 Jan
 2021 00:21:39 +0300
Date: Mon, 4 Jan 2021 00:21:47 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH v2] tcg: Fix execution on Apple Silicon
Message-ID: <X/I1a6HFZTkj/ILK@SPB-NB-133.local>
References: <20210103145055.11074-1-r.bolshakov@yadro.com>
 <CA+E+eSA_a3hJ26c6kjLm4yvsHALjKMHn3MOX5hg2-u0yqamd=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+E+eSA_a3hJ26c6kjLm4yvsHALjKMHn3MOX5hg2-u0yqamd=w@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 03, 2021 at 08:52:52AM -0800, Joelle van Dyne wrote:
> MAC_OS_VERSION_11_0 is always defined. You can see in
> usr/include/AvailabilityVersions.h
> 

It's not defined on my old MPB that has Catalina (10.15.7). The last
entries are:

#define MAC_OS_X_VERSION_10_15      101500
#define MAC_OS_X_VERSION_10_15_1    101501

I was able to compile the patch on Catalina without any issues (and I've
checked Catalina SDK doesn't provide pthread_jit_write_protect).

> ...
> 
> #define MAC_OS_X_VERSION_10_15      101500
> #define MAC_OS_X_VERSION_10_15_1    101501
> #define MAC_OS_X_VERSION_10_16      101600
> #define MAC_OS_VERSION_11_0         110000
> 
> The proper way is to do an __builtin_available check but that assumes
> you have the symbol for pthread_jit_write_protect_np which you won't
> if building on 10.15, so you need a configure time check as well.

__builtin_available is a clang extension and I'm not sure if it's
available on GCC. But I can surely add a config-time check in v3 if you
find it more preferred for iOS host support.

> I have a newer version of my patch that I haven't submitted yet
> because I was waiting for some other patches to go in first, but I can
> decouple it from the iOS stuff and submit it as a separate patchset.
> 

I'm sorry I stepped in... I didn't want to bother anyone during NY
holidays and couldn't ask for new patch revision. So I hacked it for
myself because I recently got M1 laptop and some spare time off work. In
the patch I wanted to avoid conflicts with your iOS host support patches
by limiting the patch only to macOS.

Hopefully, qemu_thread_jit_write/execute provides the room to add
reverse-enginereed implementation of pthread_jit_write_protect_np for
iOS 13 in UTM app.

Thanks,
Roman

