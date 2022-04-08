Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5C4F9E36
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 22:31:41 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncvGe-00086E-FE
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 16:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1ncvCy-0006cc-8e; Fri, 08 Apr 2022 16:27:53 -0400
Received: from smtp53.i.mail.ru ([94.100.177.113]:52768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1ncvCv-0003qG-J2; Fri, 08 Apr 2022 16:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=8i4elAR8ibx57tkI+GC31w7ekD9PtGncfs9Ra+X4EYY=; 
 t=1649449669;x=1650055069; 
 b=ygaB7W57UbvxqgEE6DVt9YZLkFPpoKs7EU6fs6JSxnVs+DMk/BNHEHHxw39vbVFv/fLsyVbY+hMhaFqSFvcFU3iMKQ4kvd+nGxg7JIccKhVDt3ALdyqpJxe058IGFgSjBGGnIM8pHZS11/yyIpGEnCq8ynZ/X5Qmk4BDEjbLQlAptHrCUjA6DlrNH/7NyGr/L1yezxX1tdG6rgW90aC/MsA5DRjFIEWVLSrqLJoHPaJ/SUDFWFNxlGyRJKwHgiUxmpekTgPwq+k+aGqXbPnRyw1Vb9Q5c5a+DUTHKakccgCKlg4l3TFdfhKp089+O5IL0MNvO1FdE5TXrqALjXl/rA==;
Received: by smtp53.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1ncvCp-0001aV-Pp; Fri, 08 Apr 2022 23:27:44 +0300
Message-ID: <f28af710-a1fd-7475-d74d-8fa46c3dd46f@mail.ru>
Date: Fri, 8 Apr 2022 23:27:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] qapi: nbd-export: allow select bitmaps by
 node/name pair
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, v.sementsov-og@ya.ru,
 yuriy.vasiliev@virtuozzo.com, jsnow@redhat.com
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-3-v.sementsov-og@mail.ru>
 <20220316212855.ra54pckg3u6xgwzw@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220316212855.ra54pckg3u6xgwzw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp53.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD916C41472748AFA045227E19566B3903F30656B554836768100894C459B0CD1B936B4EFE2D0CCEF073A62BAC44FAA9F3DB0AB0982458778584044E5D25B716109
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7051A6EFB787CE9C4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375FE8AD9F0D2764EB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89EEC0EC2BFE68A8B86DA52815D6F3A7E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE703ECDEEEF9F1DA999FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B974A882099E279BDA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC62847E7D18EB4F6B3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379D61855E8167CADED81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD9D78FC36703085156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A55C6D205F054B963DF40EA0C273D5EA1C5675E03F613B7CD5D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C974B02B4EA30DFBC1FC48B2D2FE863D0DE14FDA20C5B526EADA3C5B8BB50571190D203EC442740D1D7E09C32AA3244C0B6513AF683C0AB4258808B257D336068894E9C85370243E27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojgeI4gOLRPf1i46TFlU+LYA==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C391328EACE344F037E860B3F68F0225B7C98DA33A499B6FD3023E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.113;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp53.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

17.03.2022 00:28, Eric Blake wrote:
>> +++ b/qapi/block-export.json
>> @@ -6,6 +6,7 @@
>>   ##
>>   
>>   { 'include': 'sockets.json' }
>> +{ 'include': 'block-core.json' }
> Hmm.  Does this extra inclusion negatively impact qemu-storage-daemon,
> since that is why we created block-export.json in the first place (to
> minimize the stuff that qsd pulled in without needing all of
> block-core.json)?  In other words, would it be better to move
> BlockDirtyBitmapOrStr to this file?

Actually, looking at storage-daemon/qapi/qapi-schema.json I see block-cores.json.

That's block.json which is not mentioned in storage-daemon/qapi/qapi-schema.json.

So, I think it's OK to keep simple include for now.

-- 
Best regards,
Vladimir

