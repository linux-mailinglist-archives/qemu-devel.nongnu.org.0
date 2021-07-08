Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA913C173F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:44:03 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1X86-000760-J5
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m1WS4-0007rD-QP
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:00:37 -0400
Received: from rev.ng ([5.9.113.41]:49689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m1WS2-0004gj-Sr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g+1sdr5csp/wRyuW3RPosVH1E+2BTtc6owpGCru4Gfk=; b=AwUfP3fj8H+HcMkDQbRxmhbu2U
 pogt/TuOtO6v4n9ikOlej5j3aqAOoy31hlWCYKXVrOwwsU3LsViWNvkgubnsZJCvHeBsghwcdI61G
 HtOzn9jXwz3hk7miVX+c8Fh+trIIwZkfZ08h7CY2McHdYUUDQPdaMXxci5AcTGm0iF6M=;
Date: Thu, 8 Jul 2021 18:00:14 +0200
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: bcain@quicinc.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 babush@rev.ng, tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Subject: Re: [PATCH v5 14/14] gitlab-ci: do not use qemu-project Docker
 registry
Message-ID: <20210708180014.79df3e4d@orange>
In-Reply-To: <YNswId7vQL/zYJCR@redhat.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-15-ale.qemu@rev.ng>
 <YNswId7vQL/zYJCR@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Tue, 29 Jun 2021 15:37:21 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> We have either one or two images.  If this is a new user fork,
> we only have the $COMMON_TAG image in the main QEMU registry.
> If this is a existing fork, we might have two images, one in
> the main QEMU registry and one in the user's fork registry.
> Both of the images are to be used as a cache source, with
> the container tools figuring out which has matching image
> layers, if any.
>
> This proposed change makes TAG and COMMON_TAG identical
> which means we loose inheritance from the main QEMU
> registry, which almost always has suitable cached content.

I understand. This patch was aimed at pointing out a problem more than
offering a proper solution.

I'll try and take a look at how to do this right, but I think this
outside the scope of this patchset (and my area of expertise).

--=20
Alessandro Di Federico
rev.ng

