Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FBD454E30
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:53:57 +0100 (CET)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnR0F-0001BC-WA
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1mnQTK-0006ny-34
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:19:54 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1mnQTF-0005dg-Qu
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:19:52 -0500
Received: from vla1-a78d115f8d22.qloud-c.yandex.net
 (vla1-a78d115f8d22.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2906:0:640:a78d:115f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 44A582E0485;
 Wed, 17 Nov 2021 22:19:42 +0300 (MSK)
Received: from myt6-10e59078d438.qloud-c.yandex.net
 (myt6-10e59078d438.qloud-c.yandex.net [2a02:6b8:c12:5209:0:640:10e5:9078])
 by vla1-a78d115f8d22.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 1KzRZx59Je-JfsGfBMg; Wed, 17 Nov 2021 22:19:42 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1637176782; bh=ezKxR1lc6XlpU3/vP0HkG+INM9MlyjQzsrvmkdgciD0=;
 h=In-Reply-To:References:Date:From:To:Subject:Message-ID;
 b=Q1kKp2VZiLRd6R5ykDP8bzUM8AGZxwphzHiMRLRO3Niz4QKZiRR1XMdfFOs4spEVq
 uV/6mY0lTumZs3VyAnioLlPyYBpp4q5MzXmwT/k9dPYvl4wIygWpGtvSwhgUWQ7oeb
 m5jkc3BCQd4uoi1KwbyWDxHoKE/2tYksnjSwjYnk=
Authentication-Results: vla1-a78d115f8d22.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPv6:2a02:6b8:b081:1306::1:16] (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1306::1:16])
 by myt6-10e59078d438.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 7NjxFLSI33-Jfw4Y4ig; Wed, 17 Nov 2021 22:19:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: Re: [PATCH v1] hw/i386/amd_iommu: clean up broken event logging
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, yc-core@yandex-team.ru
References: <20211117144641.837227-1-d-tatianin@yandex-team.ru>
 <76c294d0-37fb-cdbb-98e4-9363ba5f66ee@yandex-team.ru>
 <YZVR9bJG0tuW1gai@rvkaganb.lan>
From: Valentin Sinitsyn <valesini@yandex-team.ru>
Message-ID: <abd4d295-baf6-c34f-170d-cbba071a14b4@yandex-team.ru>
Date: Thu, 18 Nov 2021 00:19:40 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZVR9bJG0tuW1gai@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=valesini@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Nov 2021 14:51:08 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 18.11.2021 00:03, Roman Kagan wrote:
> On Wed, Nov 17, 2021 at 11:13:27PM +0500, Valentin Sinitsyn wrote:
>> On 17.11.2021 19:46, Daniil Tatianin wrote:
>>> -/*
>>> - * AMDVi event structure
>>> - *    0:15   -> DeviceID
>>> - *    55:63  -> event type + miscellaneous info
>>> - *    63:127 -> related address
>> Did you mean 64:127? Fields shouldn't overlap, and 65-bit address looks
>> suspicious.
> 
> These lines are being removed by this patch.  And yes, they were wrong
> WRT the spec.
Oops I missed a minus. Sorry for that.

Valentin

