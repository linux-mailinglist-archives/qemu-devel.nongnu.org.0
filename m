Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED121535391
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 20:50:37 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuIZA-0004t6-0j
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 14:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nuIX9-0004Dl-KN
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:48:31 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nuIX8-0006lV-1M
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:48:31 -0400
Received: by mail-pg1-x531.google.com with SMTP id r71so2078536pgr.0
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 11:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9pDHvj1XxxhOT7SmEuncoL4fkxjfq02ZHdILpMB+Yqk=;
 b=AWyVlkEQOxwNz1MnnmC2HSRXrWV4qLE/tSUFKUA5CxWYEyKYkJ0sYFUxZdGmLkWTU9
 FASK2jAF85CEA9G1j/08T3WJc/HvItteUfELobE3U52nZ8qC8+WVCVl9X/v3TLOVXWLh
 Qibuchji5GBb1ao1goX8DxgVrbTf0PlCwPwZSQfMYmMGF7z7bRYbazfgoZsISrhg6P5W
 edh3l4S4XBB69heiFO8KULJDg0ZDYqhMnGEsZ5aSXKGNn4Or4/HJ3ueFgKSQa3Q0MacJ
 3SUDb4ZashNOr68XsFixG9EWarxPXXEELibBjbHBPHc4k2LWAOE1n7oHjdVOoiy696vW
 bf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9pDHvj1XxxhOT7SmEuncoL4fkxjfq02ZHdILpMB+Yqk=;
 b=IHLZlo6NH5BRRA2zcFwqrj9lJSpq2Xnglt3/see9TohhWMPWRaNlDPKAQ71tlx8W9l
 Ps48OEfn/Ztkq6IY+w76lXAmDxozHbEeqvOKDlGnv8oGGOCniQTMO/CCfBxUGJSuXA04
 nK9lmf+mRWmb6QTzBRRKO9CoQi5mTiIHhxOjLiAAcQUayD5m62+66ahI7mWXALm1wLjQ
 iJGqk/pXUWk38QMkyLNoksP+y2RUPjPtc7stfYJu48+LJ7rLs+FVNWAKBIOhDLdMBw+7
 vuPQmZxyG9YLs2CyWtdbxtcV8Q5zyLl75r74kD4ly2K3oNmtHvB7xiXgxYDDI6rqQkld
 V0MQ==
X-Gm-Message-State: AOAM532loXMnc3ORTYpWodK7se1qjRqbMvachnpXn5y654jG7cANRIhk
 HoraZ26uaC59nYmtPfarAX8=
X-Google-Smtp-Source: ABdhPJyXkuSg36ceN28P/J4sn1ckXXAif4FzPZkUa/h+vjfeXWI6pf7034wNAaw0jgvjdEUiPX80sA==
X-Received: by 2002:a63:e516:0:b0:3fa:dc6:7ace with SMTP id
 r22-20020a63e516000000b003fa0dc67acemr22497686pgh.215.1653590908282; 
 Thu, 26 May 2022 11:48:28 -0700 (PDT)
Received: from localhost ([192.55.54.49]) by smtp.gmail.com with ESMTPSA id
 q3-20020a056a0002a300b0050dc7628167sm1841386pfs.65.2022.05.26.11.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 11:48:27 -0700 (PDT)
Date: Thu, 26 May 2022 11:48:26 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 22/36] i386/tdx: Track RAM entries for TDX VM
Message-ID: <20220526184826.GA3413287@ls.amr.corp.intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-23-xiaoyao.li@intel.com>
 <20220524073729.xkk6s4tjkzm77wwz@sirius.home.kraxel.org>
 <5e457e0b-dc23-9e5b-de89-0b137e2baf7f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e457e0b-dc23-9e5b-de89-0b137e2baf7f@intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 26, 2022 at 03:33:10PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> On 5/24/2022 3:37 PM, Gerd Hoffmann wrote:
> > I think all this can be simplified, by
> >    (1) Change the existing entry to cover the accepted ram range.
> >    (2) If there is room before the accepted ram range add a
> >        TDX_RAM_UNACCEPTED entry for that.
> >    (3) If there is room after the accepted ram range add a
> >        TDX_RAM_UNACCEPTED entry for that.
> 
> I implement as below. Please help review.
> 
> +static int tdx_accept_ram_range(uint64_t address, uint64_t length)
> +{
> +    uint64_t head_start, tail_start, head_length, tail_length;
> +    uint64_t tmp_address, tmp_length;
> +    TdxRamEntry *e;
> +    int i;
> +
> +    for (i = 0; i < tdx_guest->nr_ram_entries; i++) {
> +        e = &tdx_guest->ram_entries[i];
> +
> +        if (address + length < e->address ||
> +            e->address + e->length < address) {
> +                continue;
> +        }
> +
> +        /*
> +         * The to-be-accepted ram range must be fully contained by one
> +         * RAM entries
> +         */
> +        if (e->address > address ||
> +            e->address + e->length < address + length) {
> +            return -EINVAL;
> +        }
> +
> +        if (e->type == TDX_RAM_ADDED) {
> +            return -EINVAL;
> +        }
> +
> +        tmp_address = e->address;
> +        tmp_length = e->length;
> +
> +        e->address = address;
> +        e->length = length;
> +        e->type = TDX_RAM_ADDED;
> +
> +        head_length = address - tmp_address;
> +        if (head_length > 0) {
> +            head_start = e->address;
> +            tdx_add_ram_entry(head_start, head_length, TDX_RAM_UNACCEPTED);

tdx_add_ram_entry() increments tdx_guest->nr_ram_entries.  I think it's worth
for comments why this is safe regarding to this for-loop.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

