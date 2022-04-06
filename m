Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F44F64C1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 18:11:59 +0200 (CEST)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc8GB-0004jV-6M
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 12:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nc8Ea-0003oF-OL; Wed, 06 Apr 2022 12:10:16 -0400
Received: from smtp31.i.mail.ru ([94.100.177.91]:46896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nc8EX-0003Xf-Da; Wed, 06 Apr 2022 12:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=rIXpzfIAhb6roQ5erxEnegdE2h2103EnlJTQaBlr2Ig=; 
 t=1649261413;x=1649866813; 
 b=dMvoTraR+oDLmTczAA0lgVlv0KbeD6I1W3MRGJbAgd0Fr+/UctmLC23nDK+9nEPgmgc+ZPMiDibAu87OBmWRKnG30pOWylLGRCaVYF7wFbbVcmhDNHhqqKCtDm87O4iC07AfYJ50FmslDEhxO1ubQ0z+TS3kekC7AI7pPieElsVxRIoJDQPlKtRERotvJHAHQiKeYrrM1ShkXSyQLlZlu867fOeAo4qPFMmn8bxatzUwxgexRkyGgPME/KQ/a1Qlhltq4Svze8zJrwzHJSkUyy18+XjrpgxZeiuAlYiTCrNw/IhbRpK1YYgmfmiox4OMkMVWz5U4UdQd+d1ufRQNZg==;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nc8ER-00013S-3X; Wed, 06 Apr 2022 19:10:07 +0300
Message-ID: <eb64dc51-660b-6d0f-2180-ca673323ff98@mail.ru>
Date: Wed, 6 Apr 2022 19:10:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-6-vsementsov@openvz.org>
 <929f2a0d-e3d7-afad-b95b-d7f8b29fe077@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <929f2a0d-e3d7-afad-b95b-d7f8b29fe077@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp31.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD90FA8EB11E8F64C56FC2083200DA4A48F3140D195D35BAA8B182A05F538085040E56C3E3099208BCD1C4553D35EA5F03295BB3799665161518677ED1078466463
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE716FAD50E497B9C14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637040380BD28C1B15C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8FD4EF41B4E69E38E668604C16B44C3086F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7F1FF917D59728F209FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAA867293B0326636D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE91ADC097FE2C3A08B2D370F7B14D4BC4D8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE3AD74539164518AE5BA3038C0950A5D36B5C8C57E37DE458B0BC6067A898B09E46D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE728943E96A10AE865731C566533BA786AA5CC5B56E945C8DA
X-8FC586DF: 6EFBBC1D9D64D975
X-B7AD71C0: BCAA75B3C340DBBEEF3A853C90EA8D50F01536074D6990B7EE9D5CB6078CC77C24B819214A76CED971B50B874F048A7C
X-C1DE0DAB: 0D63561A33F958A573BCDEF29E1A508F2F84872A672D1923D33CC1E6B310BF45D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346AD04FDA812EEFF19CA0B06D830E70464B87BB5E0BE71BDBEC9F65366BB7368966C5A3C5C16CCA221D7E09C32AA3244C01C4A9A6F7A0E951E1E8C5300522576530452B15D76AEC14ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj1v5/e2DytTpGfq+ba5e8Ug==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913B14A41217612006ACE1599AFB94F927CA8103BFB463E903EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.91;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp31.i.mail.ru
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

01.04.2022 16:16, Hanna Reitz wrote:
>> -static void coroutine_fn block_copy_async_co_entry(void *opaque)
>> -{
>> -    block_copy_common(opaque);
>> +    ret = call_state->ret;
>> +
>> +    return ret;
> 
> But here we still need to free call_state, right?

Right, will fix.

-- 
Best regards,
Vladimir

