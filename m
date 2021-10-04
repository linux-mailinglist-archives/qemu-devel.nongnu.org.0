Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4C420AF3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 14:36:11 +0200 (CEST)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXNCT-0003uH-FP
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 08:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mXMvV-0007BZ-6a; Mon, 04 Oct 2021 08:18:37 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mXMvS-0004LE-WF; Mon, 04 Oct 2021 08:18:36 -0400
Received: from [192.168.15.181] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9155A20896;
 Mon,  4 Oct 2021 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633349910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8uZ7Zvsb+nc3LhXNWfJAhqpbW2w0mT1Bs188rj6fLk=;
 b=b72z/qauhliLdHMFithA82aDOxKwxWsNj7Tu3etFFS1Mx6bw+PlxN/Mi4baK8mZSH2/r8l
 jXMCzg2WAJH3lP83Arv76+rwuMxCSYscXCGflGJh+z1wh3WgUTirsT2Hxx/f+EIN6ZFLYQ
 gFhMV6zWGSyOLjsjDIS51LNQeiZ0tmo=
Message-ID: <4d932317-a6aa-40d7-e8b4-86d23638a8bb@greensocs.com>
Date: Mon, 4 Oct 2021 14:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Content-Language: en-US-large
To: Peter Krempa <pkrempa@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com> <YVceUfvP2WU59l0L@angien.pipo.sk>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <YVceUfvP2WU59l0L@angien.pipo.sk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/1/21 16:42, Peter Krempa wrote:
> On Fri, Sep 24, 2021 at 11:04:25 +0200, Kevin Wolf wrote:
>> Directly call qdev_device_add_from_qdict() for QMP device_add instead of
>> first going through QemuOpts and converting back to QDict.
>>
>> Note that this changes the behaviour of device_add, though in ways that
>> should be considered bug fixes:
>>
>> QemuOpts ignores differences between data types, so you could
>> successfully pass a string "123" for an integer property, or a string
>> "on" for a boolean property (and vice versa).  After this change, the
>> correct data type for the property must be used in the JSON input.
>>
>> qemu_opts_from_qdict() also silently ignores any options whose value is
>> a QDict, QList or QNull.
> 
> Sorry for chiming in a bit late, but preferrably this commit should be
> postponed to at least the next release so that we decrease the amount of
> libvirt users broken by this.
> 
> Granted users are supposed to use new libvirt with new qemu but that's
> not always the case.
> 
> Anyways, libvirt is currently mangling all the types to strings with
> device_add. I'm currently working on fixing it and it will hopefully be
> done until next-month's release, but preferrably we increase the window
> of working combinations by postponing this until the next release.
> 
> 

Switching to qdict is really an improvement I think.

If we choose to keep legacy behavior working for now, I think we should 
find a way to still do this switch. Maybe we can temporarily keep the 
str_to_int and str_to_bool conversion when converting the qdict to the 
qdev properties  afterward ?

Damien

