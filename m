Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD546489485
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:58:31 +0100 (CET)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qVb-0007H6-06
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qOs-00082F-7F
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:51:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qOm-0007IL-JV
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28rcpQ8nf4BcobFVMZK9gPM644caH3ZFWFrW2OcWiUw=;
 b=EvnRhU1lWwmutETsUx+XeFhuaxoHMumfNyysyMEXQmD5iWBAo53jVVy7vSfsBuemWfFkfr
 6oG4tQCn3cX75qt+3kPcMBgcxJUXMvkA74ftgfNQ5GsqLg/Xz6O8uatTKpRs9zmanCq0lx
 psfE/VOgUHzLlAU6ZAnoWZVsnjtqHDw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-FYuba8W_PzWgGd9U9eQQgQ-1; Mon, 10 Jan 2022 03:51:26 -0500
X-MC-Unique: FYuba8W_PzWgGd9U9eQQgQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so9564756edz.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=28rcpQ8nf4BcobFVMZK9gPM644caH3ZFWFrW2OcWiUw=;
 b=ZZbQUnrC3obanMg8qDCQ2HkER5luUyWhH4DqFU3MM09XX2AEnumdapC3I+GGsjjMTV
 i2CaJDO7xGryNvjcGEOlXMncuvblEV6enaXri82aHyUcPCNOum6KJ9TCvSpGMjMckYNw
 pI+uBGXiEY3G7q4Wa6A2HnP2cOAJtEGAybOTzXalmAqw/hHbLJjUCm3VPwTi5o/sMgv0
 i7A7XTN/tTVRTB3EVZgWBhnlQadWVO/wNKksODSWaO2NRY4JKzreuF03SpLrNHukrbq/
 /oyErQvQsgtJI1h/X9/UWFD7m35vZp5V+uMsbQ9wrm3MrwovQ+8W//FETgYiDbJRv3Ea
 nFSw==
X-Gm-Message-State: AOAM5300zI56274JHGfU6TISKuzJhGjp5JYnG3eIZCCjLXJYFXgOLD3J
 kmj44hlh2IHXresIl3Tc1qP0rFb8pmEschGdAtVfcYStUpDAlCgEefD21Hy+IIlTaytIBOcJs6a
 JIP3l0MC4s9NuaqA=
X-Received: by 2002:a50:9dc1:: with SMTP id l1mr71146090edk.231.1641804685361; 
 Mon, 10 Jan 2022 00:51:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJpN2zWh2cGtiTHT+YefwySgq9vWKpJ+vpUkDVboPRj6nXdiZri97mvJq/CRiJ9UQ39DlpjQ==
X-Received: by 2002:a50:9dc1:: with SMTP id l1mr71146068edk.231.1641804685149; 
 Mon, 10 Jan 2022 00:51:25 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id n26sm3228677edy.96.2022.01.10.00.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:51:24 -0800 (PST)
Message-ID: <a3d4079d-90fd-5ec9-05b9-6b0a79ba4640@redhat.com>
Date: Mon, 10 Jan 2022 09:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 9/9] hw/dma: Let dma_buf_read() / dma_buf_write()
 propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-10-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220104085431.2122999-10-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Since the previous commit, dma_buf_rw() returns a MemTxResult
> type. Do not discard it, return it to the caller.
> 
> Since both dma_buf_read/dma_buf_write functions were previously
> returning the QEMUSGList size not consumed, add an extra argument
> where the unconsummed size can be stored.
> 
> Update the few callers.

I feel like this patch doesn't fit into the context of this series.
Especially as the cover letter mentiones "Finally we replace misuses
with dma_addr_t typedef."

Am I missing something?

-- 
Thanks,

David / dhildenb


