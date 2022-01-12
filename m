Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DDB48C1A2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:52:24 +0100 (CET)
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7aIo-0002ED-EQ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:52:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1n7aEd-0001Ll-CL
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:48:05 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1n7aEb-0005VS-0f
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:48:02 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7C6BA2089E;
 Wed, 12 Jan 2022 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1641980876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcpMLdkXxRp3pFYoS1HikA+W/2htK/18hCTyr2BZnnY=;
 b=lTzXM/B7qjEw3ack4VfsjMdWfIo+GV8WKfmH+YWZUz0VdgN+dyP+hY8jhgbzCOvzRMYpYM
 26xydR+wJedzRAkFRa+4Z75pTwgpplGF4yjxGyAC9uW+DYwAGMnf1T7McaBUQFOuJ+m6ku
 1mTZtC/JrJV8W0kdtYk7ivQROJM0Itw=
Message-ID: <cd48c959-9262-cc42-73c0-3d10a4bd44b1@greensocs.com>
Date: Wed, 12 Jan 2022 10:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: RFC: QMP configuration - allocating/setting qdev array properties?
Content-Language: en-US-large
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <cccba1ec-34c7-73da-1100-416a0afa8cea@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <cccba1ec-34c7-73da-1100-416a0afa8cea@greensocs.com>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, jsnow@redhat.com,
 Mark Burton <mark.burton@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mirela,

On 1/11/22 17:54, Mirela Grujic wrote:
> Hi,
> 
> 
> While working on a prototype and configuring a whole machine using QMP 
> we run into the following scenario.
> 
> 
> Some device models use array properties. The array is allocated when 
> len-<arrayname> property is set, then, individual elements of the array 
> can be set as any other property (see description above the 
> DEFINE_PROP_ARRAY definition in qdev-properties.h for more details). We 
> need to do both (allocate the array and set its elements) before the 
> device can be realized. Attempting to set len-<arrayname> and array 
> elements in a single device_add command does not work because the order 
> of setting properties is not guaranteed, i.e. we're likely attempting to 
> set an element of the array that's not yet allocated.

It happens because device options are stored in an optdict. When this 
optdict is traversed to set the qdev-properties, no specific order is used.

Better json format support would probably solve this issue in the 
long-term. But right now, we are stuck with the optdict in the middle 
which do not support advanced structure like lists or dictionaries.

We could solve this by being more "smart" in when setting the 
properties. I'm not sure we can be really smart here and detect which 
options is an array length but we could at least have some heuristic and 
for example: set first "len-xxx" properties so that array will be 
allocated before being filled.

> 
> Allowing the device initialize and realize phases to be split would 
> solve this problem. For example, the device_add would be issued with 
> 'realized=false', we can set the len-<arrayname> in the same device_add 
> command or a following qom-set command, then we would use a sequence of 
> qom-set commands to set array elements, and at the end, we would realize 
> the device by issuing qom-set path=<device_id> property=realized 
> value=true. This is what we currently do in our prototype.

I think that is a bad idea. Because then the user would have access to a 
"not-realized" device (which is really a not-constructed object).
It could then do anything with the object (which might work or not 
might). And at the end, maybe realize will fail and that would leave 
qemu in a inconsistent state: the object will be used somewhere and at 
the same time it will be a state where it is not usable.

Thanks,
Damien

