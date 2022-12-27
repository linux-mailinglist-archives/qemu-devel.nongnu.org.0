Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94DC65671F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 04:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA0hy-0000xO-PY; Mon, 26 Dec 2022 22:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pA0hu-0000xF-BH
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 22:32:50 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pA0hf-000334-4Q
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 22:32:50 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Nh0Zm1z80z8PbP;
 Mon, 26 Dec 2022 22:32:16 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=PKPPpKYJ9
 Y5xRKYNpRcI+R8WglA=; b=gje7dZztd/Xw1s23foX3b6v33s7DDS1kyI8gqpu1L
 oQbHDy4wfhKzD9Eb6VwgMiKbVQB46CKWiw249aEeDEE3JEY3OUphg9jFqBMVbO5W
 8bH9jz9agkjhgBtn+EJX6xOQH1hZV8Or+zgyiyCkeglWQe/M6OvVZgEi9lnyTmDp
 /A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Q6c
 ydIQiKeoI1YV4qIMhlHMi6XVlSSrfq8H/ZcmkYkZf9uUXXvBnOPz1wJi5nUT6TxT
 OVo4cGcLJlxrDkLTaFTRwszCR34skGYTVOSZ3ledD9yTtkG+C1wpYGsgtTYT5JPK
 WuiCe2HJ4N++HRvhogrzIp4n87wSHAUccX1Esw6I=
Received: from [IPV6:2001:470:b050:6:4dce:58f9:3c2d:1020] (unknown
 [IPv6:2001:470:b050:6:4dce:58f9:3c2d:1020])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Nh0Zm0LNWz8PbN;
 Mon, 26 Dec 2022 22:32:16 -0500 (EST)
Message-ID: <0f9669b3-ef29-e41f-6a44-1c54968b3766@comstyle.com>
Date: Mon, 26 Dec 2022 22:32:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101
 Thunderbird/109.0
Subject: Re: [PATCH] qga: Add initial OpenBSD and NetBSD support
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <Y2+GO5jyd9E2uCT9@humpty.home.comstyle.com>
 <56ef5603-523f-f180-55e4-12c9a0b4d02a@linaro.org>
 <CAPMcbCoB_k0Qp2haWqU8j4fmmCnE+_b4T6hoK3+NpaOcHZO0Gg@mail.gmail.com>
 <CAPMcbCoC5Jrq3BGyZGo3uLSEj86QrACjmhQxY_HaWaWoq3sEeQ@mail.gmail.com>
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <CAPMcbCoC5Jrq3BGyZGo3uLSEj86QrACjmhQxY_HaWaWoq3sEeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/26/2022 9:02 AM, Konstantin Kostiuk wrote:
> the series was merged

Thank you.

