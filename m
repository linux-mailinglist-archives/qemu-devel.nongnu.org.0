Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CAF5FDEB7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:13:03 +0200 (CEST)
Received: from localhost ([::1]:48172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1lW-0004Kw-6v
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oj1iD-0001Ju-AA
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oj1iA-0004GQ-23
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665680972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MPsevQZI2YFT5WxyapevNPOSIvH7V9m0ouOuBstER0g=;
 b=Z0cQiDpawhlqMxCPJpNtmeSAB3iw3wRdGVaV3cniR3wXv4eD8oAXrHsy8COVqq5/WXwxf6
 axji4SqPDW/i23nFlro5rgiVM+rcGeJz8vHuZptZARdoi+RisTx6Vd6VBhSjSLzRZAi+HX
 PjrYYtFdiGJ6zFc+uOaOoMK03SrjaMI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-R4OLWHtSOiOF00cqgRJVlw-1; Thu, 13 Oct 2022 13:09:31 -0400
X-MC-Unique: R4OLWHtSOiOF00cqgRJVlw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l15-20020a05600c4f0f00b003b4bec80edbso1486431wmq.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 10:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPsevQZI2YFT5WxyapevNPOSIvH7V9m0ouOuBstER0g=;
 b=8IObFiIX7wUosQZCwZ7KeOjtjnXQH/2xHv8mWaqK4uogisCvRvGi2JCAz5IoGV6j8A
 i0JMYCAkOYevxfXRO5qN7RHg/TsqL5IcgPfJicHj9ba3vKqJCVi4ttY8Ky0d2GBdWfNq
 xFjaD6fhdUVJ/FuWu59WJHdGkuHrqlWMsZttuEIYRAUfeRBXQDFzdePkQt2qwOWoZnjC
 YhaUNwdyAZhVKC1n/tDN2aLQiXynThN1y34i3/CFhpybxcT0ggIEp6+fZMV6mgLmyv47
 wHpembPdPbzF8Kq6o5b26/lVQrcjNVeGcRnnYh3NIkT28bjpcYFVj0GfN1BzRAZ/DKeH
 cMyg==
X-Gm-Message-State: ACrzQf1ZVRlVsCUYf1+EaYuF3etbX7Scp3BzEurGVg9sqwcZQxfA463b
 DVgG4XAn3O8kfASUwslJreWaG4G6vUplqwfuuFFyKlZOXeUoikvCRLbuyRENCO/Htjl8yl52Bob
 NoBtmxTqzhLfyPqI=
X-Received: by 2002:a5d:408e:0:b0:22e:650a:ec4b with SMTP id
 o14-20020a5d408e000000b0022e650aec4bmr710509wrp.212.1665680970296; 
 Thu, 13 Oct 2022 10:09:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BB9rBZwVA8TUQYbFSgyFj0EK5O2zi2BfR7zDBQMld8l8nUceBJpiwSiK4odw6KRLeMDudOA==
X-Received: by 2002:a5d:408e:0:b0:22e:650a:ec4b with SMTP id
 o14-20020a5d408e000000b0022e650aec4bmr710499wrp.212.1665680970090; 
 Thu, 13 Oct 2022 10:09:30 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b003c6bbe910fdsm5841564wmc.9.2022.10.13.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 10:09:29 -0700 (PDT)
Date: Thu, 13 Oct 2022 13:09:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 Huai-Cheng Kuo <hchkuo@avery-design.com.tw>,
 Chris Browy <cbrowy@avery-design.com>, ira.weiny@intel.com,
 linuxarm@huawei.com
Subject: Re: [PATCH v8 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Message-ID: <20221013130840-mutt-send-email-mst@kernel.org>
References: <20221013120009.15541-1-Jonathan.Cameron@huawei.com>
 <20221013120009.15541-5-Jonathan.Cameron@huawei.com>
 <Y0g8UgumJwqU4QyB@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0g8UgumJwqU4QyB@memverge.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 12:26:58PM -0400, Gregory Price wrote:
> Other than the nitpicks below, lgtm.  Not sure if you need a sign off
> from me given the contributions:
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> 
> > +/* If no cdat_table == NULL returns number of entries */
> > +static int ct3_build_cdat_entries_for_mr(CDATSubHeader **cdat_table,
> > +                                         int dsmad_handle, MemoryRegion *mr)
> > +{
> > +    enum {
> > +        DSMAS,
> > +        DSLBIS0,
> > +        DSLBIS1,
> > +        DSLBIS2,
> > +        DSLBIS3,
> > +        DSEMTS,
> > +        NUM_ENTRIES
> > +    };
> // ...
> > +    if (!cdat_table) {
> > +        return NUM_ENTRIES;
> > +    }
> 
> the only thing that i would recommend is making this enum global (maybe
> renaming them CT3_CDAT_[ENTRY_NAME]) and using CT3_CDAT_NUM_ENTRIES
> directly in the function that allocates the cdat buffer itself.


Yes I think I agree here.

> I do
> understand the want to keep the enum and the code creating the entries
> co-located though, so i'm just nitpicking here i guess.
> 
> Generally I dislike the pattern of passing a NULL into a function to get
> configuration data, and then calling that function again.  This function
> wants to be named...
> 
> ct3_build_cdat_entries_for_mr_or_get_table_size_if_cdat_is_null(...)
> 
> to accurately describe what it does.  Just kinda feels like an extra
> function call for no reason.
> 
> But either way, it works, this is just a nitpick on my side.
> 
> > +static int ct3_build_cdat_table(CDATSubHeader ***cdat_table, void *priv)
> > +{
> > +    g_autofree CDATSubHeader **table = NULL;
> > +    CXLType3Dev *ct3d = priv;
> > +    MemoryRegion *volatile_mr;
> > +    /* ... snip ... */
> > +}
> 
> s/volatile/nonvolatile


