Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB64502862
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:34:49 +0200 (CEST)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfJHs-0000Vk-31
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfIeU-0001TO-K4
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:54:06 -0400
Received: from smtp42.i.mail.ru ([94.100.177.102]:57590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfIeR-0006dv-Ti
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=sYXxIOCnzyzie/Mvzgnctm+CtvUbwVu6REbPCcZ2/M0=; 
 t=1650016443;x=1650621843; 
 b=Wj0AviRujcCkM35/OGFnUy1yqHNMrl/MzvL0tzdDi5V3ooW6UhBuCEVC7P/yugOM4RU07ps91hXMYPSoaXdnb96rvZ2TdR2ZHw4cpY+vUA7Y2k8BJXdHBfT39gSAvRa/2HaX5z2NSuIZSSS+wcuONmL+forKSmG9myd1fjNIanfNowUpzDnHKx0LlVQ9ozwKzXN8mIQQRuflBOO1o1lDeaRiqxNfREY81kTuQcvhO5l/eoAmZDtUIUGuDpVovPSQuZiO29tb1bRAWNmhsE7KATla0F7h9mMvFf12U79maT+mXEr6NC7TxL8MBMOU98I3mpi5SfVmMALs240WlElJOQ==;
Received: by smtp42.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfIeL-0003Fe-Ne; Fri, 15 Apr 2022 12:53:58 +0300
Message-ID: <0e2c0b96-694e-b455-a188-abe4195658f3@mail.ru>
Date: Fri, 15 Apr 2022 12:53:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 1/9] nbd: safeguard against waking up invalid
 coroutine
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp42.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD916C41472748AFA044802A7C8EAC3687C03551E4DDAECA58400894C459B0CD1B926833D9B1D4A04852088682DF0122194A8D65498B51A35C50CC985FF34F4B040
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73B44982FA5E78411EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372A1456D053D20C618638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85DDFD3BC21F98039527C29AD9222ABEF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7212612128AA291179FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86D2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B4BCA9BFFB0DD4195A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC7DB54CB80184FD603AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637CA98D6A1C4115CFDEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3CE5B583A975D522235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5B6A5F097B63897C81A2F02E028D05F8A3C96E807CE9B0FE5D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D2AC226BFD4557243E66BEAA937B5863DE90839A4A17991D78B527CE741241EDA7A6EF45ACC122E81D7E09C32AA3244C55E747CB3F0033A93F1C8C7C789CCAB5A995755A1445935EFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNgQIGdrTxnjYmgPB4gZbEg==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C39131B391111998B0479F0E1109C9E3B7D14976AF1CB91E6F281E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.102;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp42.i.mail.ru
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

14.04.2022 20:57, Paolo Bonzini wrote:
> The .reply_possible field of s->requests is never set to false.  This is
> not a problem as it is only a safeguard to detect protocol errors,
> but it's sloppy.  In fact, the field is actually not necessary at all,
> because .coroutine is set to NULL in NBD_FOREACH_REPLY_CHUNK after
> receiving the last chunk.  Thus, replace .reply_possible with .coroutine
> and move the check before deciding the fate of this request.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

-- 
Best regards,
Vladimir

