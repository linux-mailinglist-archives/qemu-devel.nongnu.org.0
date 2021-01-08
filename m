Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4CB2EEDB9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 08:10:52 +0100 (CET)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlv8-0003IY-OV
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 02:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxltk-0002rF-NQ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 02:09:24 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxlth-0005Hj-Rd
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 02:09:24 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DBvMW62tczR1v8;
 Fri,  8 Jan 2021 15:08:23 +0800 (CST)
Received: from dggema758-chm.china.huawei.com (10.1.198.200) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 8 Jan 2021 15:09:14 +0800
Received: from [10.174.186.85] (10.174.186.85) by
 dggema758-chm.china.huawei.com (10.1.198.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 8 Jan 2021 15:09:14 +0800
Subject: Re: [PATCH] vnc: add qmp to support change authz
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210107124657.650-1-changzihao1@huawei.com>
 <20210107160410.bh27ibafc2szsayh@sirius.home.kraxel.org>
From: Zihao Chang <changzihao1@huawei.com>
Message-ID: <9b83b14a-61b1-d638-8924-af5ed32c55a3@huawei.com>
Date: Fri, 8 Jan 2021 15:09:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210107160410.bh27ibafc2szsayh@sirius.home.kraxel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.85]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggema758-chm.china.huawei.com (10.1.198.200)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=changzihao1@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/1/8 0:04, Gerd Hoffmann wrote:
>   Hi,
> 
>> This patch add a new qmp 'change-vnc-authz' to support change the
>> tls/sasl authz of vm. If index='', unset tlsauthzid/sasl.authzid
>> {
>>    "execute":"change-vnc-authz",
>>    "arguments":{
>>       "index":"object-authz-id",
>>       "type":"tls/sasl"
>>    }
>> }
> 
>> +##
>> +# @change-vnc-authz:
>> +#
>> +# Change the VNC server authz.
>> +#
>> +# @type:  the new authz type to use with VNC authentication
>> +# @index:  the new authz object index to use with VNC authentication
>> +#
>> +# Since: 5.2
>> +#
>> +##
>> +{ 'command': 'change-vnc-authz',
>> +  'data': { 'type' : 'str',
>> +            'index': 'str'},
>> +  'if': 'defined(CONFIG_VNC_SASL)' }
> 
> type should be an enum I think.
It is a good idea to set type to enum, I will fix it in the next version.

> Also index should be an int (and possibly an optional argument so you
> can just not specify index to unset).
> 
Index is the id of authz object(myauthz, user can set it as they wanted), may not use int.
-object authz-simple,id=myauthz,identity=test1

> take care,
>   Gerd
> 
> .
> 
BTW, Daniel P . Berrangé suggests that all property set QMP commands should be integrated
as an general purpose "display_update" QMP command. That's really a good idea. This may
take longer time to design and code. Will we not think about adding new property set QMP
until the general purpose "display_update" QMP is ready？

https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg00941.html


Thanks，
Zihao

