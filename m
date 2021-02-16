Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DA31CEF5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:27:27 +0100 (CET)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC48E-00039L-D4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lC46M-0001l4-1s; Tue, 16 Feb 2021 12:25:30 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lC46I-00074p-7t; Tue, 16 Feb 2021 12:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=p2DPRaW5BVPg1Gd/UKuWPjJlWfSmZgkYHUNEMpXC8C8=; 
 b=mIFg/9lwwnxv8TyydOxNeKvcQZZ6icIeL3+VA7p5YnQsSXId+ftRmWV9ETwiSq5mAEEiRH/uir5nQlAVTGD2E9VYfjnjcwUpcoPq44xCKLWcnPOi2pwpnXzpBWqxkB5/DfRV8jHxriGWXiDU0zws/loduhgz6fI3gnxfCJu5umjcQ4qoouTJuf/0YLXr8N8PrihfcbjwTj2HpRxPA0qqS9oQHPqg31HqhOqHdUOr8fUktupOCt3kR/dC9tTgooRmZH4mgAFA8GaDHgTwzLQ/uxN6T7xiVvYxA+u6KF8Dxt0lGMX/HA/W9vFBtYGNJB0qmbsr80r3hTTzgdLPjn3hzw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lC46E-0001lG-MT; Tue, 16 Feb 2021 18:25:22 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lC46E-00006m-D0; Tue, 16 Feb 2021 18:25:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH v2 0/4] Allow changing bs->file on reopen
In-Reply-To: <20210216164807.GC5282@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <20210210172657.GJ5144@merkur.fritz.box>
 <w514kic2cmf.fsf@maestria.local.igalia.com>
 <20210216164807.GC5282@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 16 Feb 2021 18:25:22 +0100
Message-ID: <w511rdf3oxp.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, pkrempa@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 16 Feb 2021 05:48:07 PM CET, Kevin Wolf wrote:

>> There is no problem with removing the filter anymore. See here for a
>> description of the original problem:
>> 
>> https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00090.html
>
> Ah, nice. Can we just add removing the filter again to the test then?

That is already in this series, see patch #2.

Berto

