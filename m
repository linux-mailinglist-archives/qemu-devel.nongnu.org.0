Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61167529E63
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:46:15 +0200 (CEST)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtmQ-00073c-Dy
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqtVt-0003YK-5n; Tue, 17 May 2022 05:29:09 -0400
Received: from smtp39.i.mail.ru ([94.100.177.99]:58122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqtVq-0003tM-Tz; Tue, 17 May 2022 05:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=y+s6y5QldXfCEV83acd85DMNatbDxJbVXkHVhHVccS4=; 
 t=1652779746;x=1653385146; 
 b=JRGXpJbIRjTnx/oxeuKsWODKne7RTqv+PTwXodCGvscXTL3zIkaxsECamb4g6zzGD1FbgEUGA+dYAKtHoBuy0wqrUNkG3r7Sl1vKan7/cx/XGfnGjhkNaDw7a0XDIRlszNyuxqZEeE6rFRHiAAZ7g7phj09h+AoHTymE/uebI0zYkL1gnbq7ghi3J27LfA8//dSfXhnGhRF7YKU7heiexhkqjv35biOpDx6e+67P7AGbORkN2H8r4NyD4WMaD7uT6hv07cFe+aoxxiYo7bsHJPWp7yZlGY57hmKtuldlQZsHcsbMCLRZbb/SG5CYvAroOGQ4JR44q0T+F+QSZAFJnw==;
Received: by smtp39.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nqtVm-0007BQ-AV; Tue, 17 May 2022 12:29:02 +0300
Message-ID: <f708b0cf-4cb2-0c28-4fbd-8253983de285@mail.ru>
Date: Tue, 17 May 2022 12:29:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/10] block: Use bdrv_co_pwrite_sync() when caller is
 coroutine_fn
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
 <20220513155749.2488070-7-afaria@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220513155749.2488070-7-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp39.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AB830312DE1E2EF83FFDFE29368BDF0C92BB308949727AF8182A05F538085040C62DCA1A382548360D0BD1FA8205A36D0550C9A99452C891F9BA7DC9DE5A0A69
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76C0A440987CA342DC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE757AEC41D7AA04458EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA673512B862C7988A7A22D30622A31E91420879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C04A3B2F4BA56A4D558941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637D0FEED2715E18529389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637226B4A4AEAABFFF1D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7560B0716F91C989AEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C39D5FFCAB907964CF35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A56ECAEA51ABCC8C15D1F9F7EA28B83C2D762735088CDC7BDBD59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3403182E70AE6895E067E2C6359D19834B28B7180B0A694E1D0B7C155C365A30860EA8B7A1881EB06C1D7E09C32AA3244CAA48227DFD617B543C1025FE6C8EFF5AF2F5F14F68F1805BDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394PgsI2TxVIctw==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D4400F5178303C30F28063ECDDF83BE70307F306E8EAFEC2566E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.99;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp39.i.mail.ru
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

13.05.2022 18:57, Alberto Faria wrote:
> Convert uses of bdrv_pwrite_sync() into bdrv_co_pwrite_sync() when the
> callers are already coroutine_fn.
> 
> Signed-off-by: Alberto Faria<afaria@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>

-- 
Best regards,
Vladimir

