Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D332622A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:52:56 +0100 (CET)
Received: from localhost ([::1]:59990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFbfy-0005ow-M7
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lFbeT-000595-E5; Fri, 26 Feb 2021 06:51:21 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:57586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lFbeQ-0001Za-UA; Fri, 26 Feb 2021 06:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=XiBgwW6DaMwqaMA5rKrkNAvMDIaZ7H9RgiuUA0bStYw=; 
 b=XfiUGmyfcIWEFY2xarlAEkfgCu5b+9UnSHNG10kbW4JpKVAa2APKPod39pEuXPadpAewR1jTZSZ2HVVoNQWtzyBvsCTBsk84EIzTZuVnW+GxOIB5DILv8T54V2bsmpIcACsKEkvtKPgaOUT7Ia2tr+UP27g1PZEG2l1XZ1RyvgNkqD9PWNR4b7SusuJsXu15/ABOLI8PmqBviCt8uS3Nof1uW1H5cIxWGNnCGyUK/0V3nsPjbGBvCY5Ttk0B0Ioa+pB7lbBZdkFpM6DyyckCAp9BTfg+oc3WiIAhw1kESY4aDu5xuInDKhSPZVO47PeqXOGUAqN4uxu+501aTuNXHw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lFbeL-00008D-An; Fri, 26 Feb 2021 12:51:13 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lFbeL-0003Fv-14; Fri, 26 Feb 2021 12:51:13 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
In-Reply-To: <20210224123305.GA11025@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
 <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
 <20210224123305.GA11025@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 26 Feb 2021 12:51:13 +0100
Message-ID: <w518s7bjbda.fsf@maestria.local.igalia.com>
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 24 Feb 2021 01:33:05 PM CET, Kevin Wolf <kwolf@redhat.com> wrote:
>> >   { 'command': 'x-blockdev-reopen',
>> > -  'data': 'BlockdevOptions', 'boxed': true }
>> > +  'data': { 'options': ['BlockdevOptions'] } }
>> 
>> Do we also want to drop x- prefix?
>
> libvirt really wants to have a stable blockdev-reopen interface in 6.0
> because enabling the incremental backup code depends on this (they
> just toggle the readonly flag if I understand correctly, so most of
> the work we're currently doing isn't even relevant at this moment for
> libvirt).
>
> Given that the soft freeze is coming closer (March 16), I wonder if we
> should just make this API change and declare the interface stable. We
> can then make Vladimir's fixes and the file reopening on top of it -
> if it's in time for 6.0, that would be good, but if not we could move
> it to 6.1 without impacting libvirt.

I expect to publish the new version of my patches next week, although
they still apply on top of Vladimir's code, which is not rebased.

We can of course simply update the API and implement the functionality
later, but apart from dropping the prefix we would also be changing the
parameters so qmp_x_blockdev_reopen() would also need to be modified.

Berto

