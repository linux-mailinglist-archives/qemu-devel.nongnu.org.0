Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2E69486D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:45:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa5I-0008G8-1L; Mon, 13 Feb 2023 09:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRa55-000863-VF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRa52-0006K9-9q
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676299516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AxjYa4ibZr6WTYwacfijWbf8SdqMkdFwV/yd6nqTpNs=;
 b=Ut9HfBFsdJRBrUh3Er2S2GA1nGThyZnDRr0liCdA0V15aZV64tFP448d+V3zQd9sr/nR7b
 CRRVKqzu8TEevsyZVhPctRBHM8hAV18KbuLzHg4dwG90uua76rSXhqkfVZXPGB5Sr2+VHj
 Ij7Ov8ifiDtkySv7qVQZ/gEuQY/nfY4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-6qh30AXuPXWmTAvXJjteFQ-1; Mon, 13 Feb 2023 09:45:14 -0500
X-MC-Unique: 6qh30AXuPXWmTAvXJjteFQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 x14-20020a05620a14ae00b0072f7f0f356bso7560577qkj.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxjYa4ibZr6WTYwacfijWbf8SdqMkdFwV/yd6nqTpNs=;
 b=YC6LZOZzjS1NFEey+60R9YbcU9NfLdAZx8MqHE6LHA7BDufUJeNSoValL8iz0J9CCO
 XbKm9oCRDpc33uhQtIRvwsUUe7DlUu3LQ2kp4eVWJH4fZx3MsQOFiaNFgF/gHs2eqXE7
 eBOrBBfUc0ZtW9kqxV4tXPwxPADPOi6/mRMwTfAhq8e8J8wJm0yMgEgV7jNNA7+SmC41
 KOvo43BEOkcnrjnbXSmtbsgPe5Ab3/uT0H09pU21i7Qvw3MRATTTHBuQmUvoef1f5E6t
 GLXk3hcg7Oz7YjyxfXwjx30u1n2IzWU56wbwWfhGbxl2l4scEnmi+WvQ4/T+n6UqlR4D
 wBNA==
X-Gm-Message-State: AO0yUKX6rQw4Z+WLOksftBo9xeHH82cb9eS+0plsTkFOkmtvWjWyNmod
 s3Y+xtW2u2ykv4q5NRp32kMAOXAitxzjk7tC/0jtqHLqm8CsWFO4xScQpmIDCwIFEhMA3axGjoK
 zgLS01FIA1OeZBvE=
X-Received: by 2002:a05:622a:1115:b0:3b8:5199:f841 with SMTP id
 e21-20020a05622a111500b003b85199f841mr51522361qty.0.1676299514409; 
 Mon, 13 Feb 2023 06:45:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8yIWAEBUwYtiK7lZZbwBpMsXTy6CUNkREmO5k/hOPIQmyBWOZRfNGj4Bnf5896SZsVdxYAOg==
X-Received: by 2002:a05:622a:1115:b0:3b8:5199:f841 with SMTP id
 e21-20020a05622a111500b003b85199f841mr51522334qty.0.1676299514173; 
 Mon, 13 Feb 2023 06:45:14 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 h7-20020ac85047000000b003b9a50c8fa1sm9223936qtm.87.2023.02.13.06.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:45:13 -0800 (PST)
Date: Mon, 13 Feb 2023 09:45:12 -0500
From: Peter Xu <peterx@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, philmd@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Message-ID: <Y+pM+H1PvTUUHrhx@x1n>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
> On 07/02/2023 17.33, BALATON Zoltan wrote:
> > On Tue, 31 Jan 2023, BALATON Zoltan wrote:
> > > On Thu, 19 Jan 2023, BALATON Zoltan wrote:
> > > > Currently -d guest_errors enables logging of different invalid actions
> > > > by the guest such as misusing hardware, accessing missing features or
> > > > invalid memory areas. The memory access logging can be quite verbose
> > > > which obscures the other messages enabled by this debug switch so
> > > > separate it by adding a new -d memaccess option to make it possible to
> > > > control it independently of other guest error logs.
> > > > 
> > > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > 
> > > Ping? Could somebody review and pick it up please?
> > 
> > Ping?
> 
> Patch makes sense to me and looks fine, so:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> ... I think this should go via one of the "Memory API" maintainers branches?
> Paolo? Peter? David?

Paolo normally does the pull, I assume that'll still be the case.  The
patch looks good to me if Phil's comment will be addressed on merging with
the old mask, which makes sense to me:

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


