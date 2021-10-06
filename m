Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D492423D73
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 14:08:03 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY5iL-0001jZ-8T
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 08:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mY5be-0000HQ-Tf
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:01:07 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:55752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mY5Zf-0008Pp-TE
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:01:04 -0400
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5011920777;
 Wed,  6 Oct 2021 11:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633521540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6K6zwK//fR5vIN2W5rGorZf+m7MG0veIGP/dJjU5Rk=;
 b=aLtwKbxFaGBu3JByHAKiAuJ9N8FLOQk2pVjtXzoolCLCR1FJ+n4HIRP84hcTSz1opTQlTm
 SpTecOCm56A5sFRc/dNYI5GenmsLCqqLKDWsuStXMX2ZblDyoUwH0RRc0oGgsxxoLilmqp
 YSyBP3icnkwU3Yhapcq11AhbDq8PEIk=
Message-ID: <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
Date: Wed, 6 Oct 2021 13:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/6/21 13:49, Philippe Mathieu-Daudé wrote:
> On 10/6/21 13:37, Damien Hedde wrote:
>> Right now, we cannot load some binary file if it is bigger than the
>> machine's ram size. This limitation only occurs when loading a
>> binary file: we can load a corresponding elf file without this
>> limitation.
>>
>> This is an issue for machines that have small ram or do not use the
>> ram_size feature at all.
>>
>> Also get rid of "hw/boards.h" include, since we needed it only
>> to access `current_machine`.
>>
>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>
>> Hi Alistair,
>>
>> I found this while experimenting with a ram_size=0 machine.



> 
> Where are you loading your file?
> 

In a rom.

The loader does not check at all that we are loading to the machine's 
ram. It just check the size for the raw binary file format.

--
Damien



