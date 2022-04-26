Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8350EE34
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 03:45:14 +0200 (CEST)
Received: from localhost ([::1]:58784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njAGP-0004Xs-JA
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 21:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1njAEl-0003X1-9o; Mon, 25 Apr 2022 21:43:31 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:38164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1njAEi-0007jd-51; Mon, 25 Apr 2022 21:43:30 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23Q1UDAT071938;
 Tue, 26 Apr 2022 09:30:13 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 26 Apr
 2022 09:42:39 +0800
Date: Tue, 26 Apr 2022 09:42:32 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v5 2/3] aspeed/hace: Support AST2600 HACE
Message-ID: <20220426014230.GA2615@aspeedtech.com>
References: <20220422051909.27540-1-steven_lee@aspeedtech.com>
 <20220422051909.27540-3-steven_lee@aspeedtech.com>
 <17d96382-de18-986e-877c-d87092c0816d@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17d96382-de18-986e-877c-d87092c0816d@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23Q1UDAT071938
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 04/25/2022 21:46, Cédric Le Goater wrote:
> On 4/22/22 07:19, Steven Lee wrote:
> > +/**
> > + * Check whether the request contains padding message.
> > + *
> > + * @param s             aspeed hace state object
> > + * @param iov           iov of current request
> > + * @param req_len       length of the current request
> > + * @param total_msg_len length of all acc_mode requests(excluding padding msg)
> > + * @param pad_offset    start offset of padding message
> > + */
> > +static bool has_padding(AspeedHACEState *s, struct iovec *iov,
> > +                        hwaddr req_len, uint32_t *total_msg_len,
> > +                        uint32_t *pad_offset)
> > +{
> > +    *total_msg_len = (uint32_t)(ldq_be_p(iov->iov_base + req_len - 8) / 8);
> > +    /*
> > +     * SG_LIST_LEN_LAST asserted in the request length doesn't mean it is the
> > +     * last request. The last request should contain padding message.
> > +     * We check whether message contains padding by
> > +     *   1. Get total message length. If the current message contains
> > +     *      padding, the last 8 bytes are total message length.
> > +     *   2. Check whether the total message length is valid.
> > +     *      If it is valid, the value should less than or equal to
> > +     *      total_req_len.
> > +     *   3. Current request len - padding_size to get padding offset.
> > +     *      The padding message's first byte should be 0x80
> > +     */
> > +    if (*total_msg_len <= s->total_req_len) {
> > +        uint32_t padding_size = s->total_req_len - *total_msg_len;
> > +        uint8_t *padding = iov->iov_base;
> > +        *pad_offset = req_len - padding_size;
> > +        if (padding[*pad_offset] == 0x80) {
> > +            return true;
> > +        }
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +static int reconstruct_iov(AspeedHACEState *s, struct iovec *iov, int id,
> > +                           uint32_t *pad_offset)
> > +{
> > +    int i, iov_count;
> > +    if (pad_offset != 0) {
> 
> pad_offset can not be NULL. or may be you meant *pad_offset ?
> 
> Thanks,
> 
> C.
> 
> 

Yes, it should be *pad_offset, I will fix it.

Thanks,
Steven

> > +        s->iov_cache[s->iov_count].iov_base = iov[id].iov_base;
> > +        s->iov_cache[s->iov_count].iov_len = *pad_offset;
> > +        ++s->iov_count;
> 
> 
> > +    }
> > +    for (i = 0; i < s->iov_count; i++) {
> > +        iov[i].iov_base = s->iov_cache[i].iov_base;
> > +        iov[i].iov_len = s->iov_cache[i].iov_len;
> > +    }
> > +    iov_count = s->iov_count;
> > +    s->iov_count = 0;
> > +    s->total_req_len = 0;
> > +    return iov_count;
> > +}
> > +
> 

