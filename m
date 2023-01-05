Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B85B65F292
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:24:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTtw-0006YE-0U; Thu, 05 Jan 2023 12:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDTtR-0006X4-FA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:19:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDTtD-0006IV-Q0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672939131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xIlPuzqqzMVTJPDqTYZhN3PGHM5ZQ6BYUSXg4T8FM2s=;
 b=IttwQPCWt+GQkdIhue8IHEv+us71dFbbywMB+jQxzUxxU1VA0RKCPrszQsOcbct0sA1MOC
 NlBZ+F/Kw3Cp1GA9Ues6XYtjtQdf62kQQhRCvKsbYWWC6epjKS++A0T+t4iyDha43XzrLO
 a/8hxA8LDmdJm0dl4GN0hCvdKcTfEXE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-b7dogKxLOf-U0dtHyOsSwQ-1; Thu, 05 Jan 2023 12:18:49 -0500
X-MC-Unique: b7dogKxLOf-U0dtHyOsSwQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 f13-20020a05620a408d00b006fc740f837eso25744917qko.20
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIlPuzqqzMVTJPDqTYZhN3PGHM5ZQ6BYUSXg4T8FM2s=;
 b=6VUMfwTiawvO3lyQsM+WEUAS9FY4Yb+qp4LRI49naksA7hRrnsown6wnI0N9HuoN8x
 AMUUMocKndwQ19H92TBorT5AXWmmeTav8+VnkqX9XzpKe+N4sSqiz8bhbpTEUTtafMno
 PEAaKvziJhE1SJ3SRcfivXDGSyCT47WO00m/CqIWqVYQDbgBnJvDHdMesBXFAgfBf2aZ
 6FZzFdonBpRsX2dWHt18l69w++PHd5KaBjx+oSkLERTa/asnSyUjzyGpRfgyPshcXwzc
 CNwGGaZhZ3yupOEj+5uinWxwNDsZQdMDcbSDOoChQCGovuWBqhkSoCbDn8XwY45nLYq0
 I8Gg==
X-Gm-Message-State: AFqh2kpxpLEZ1QbbH8aQJ8nlXIIZvV3xLDMgZ0VybVc+thXjg3DIC0KZ
 BynWC9chp409hiFKoCu9bhNpAU0jbHgsegnC4XXzgHQ1F00yZFuDzW5WU1PpO9dr8AImSRXHOcY
 XxYaFuSHKAfzZdsk=
X-Received: by 2002:ad4:551d:0:b0:4c7:52c2:39f8 with SMTP id
 pz29-20020ad4551d000000b004c752c239f8mr66631568qvb.24.1672939129131; 
 Thu, 05 Jan 2023 09:18:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu31ltWs+Uk7c3T3PNIlMb4M7pHRQD67Uk7IN4rRhTeUxtAviqe0s99i1EhNsgYaveAaZqnwQ==
X-Received: by 2002:ad4:551d:0:b0:4c7:52c2:39f8 with SMTP id
 pz29-20020ad4551d000000b004c752c239f8mr66631539qvb.24.1672939128834; 
 Thu, 05 Jan 2023 09:18:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a29ca00b006ee949b8051sm25988254qkp.51.2023.01.05.09.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 09:18:48 -0800 (PST)
Date: Thu, 5 Jan 2023 12:18:47 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 3/6] migration: Factor out checks for advised and
 listening incomming postcopy
Message-ID: <Y7cGdweVxbGlcvWh@x1n>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221222110215.130392-4-david@redhat.com>
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

On Thu, Dec 22, 2022 at 12:02:12PM +0100, David Hildenbrand wrote:
> +bool migration_incoming_postcopy_listening(void)
> +{
> +    PostcopyState ps = postcopy_state_get();
> +
> +    return ps >= POSTCOPY_INCOMING_LISTENING && ps < POSTCOPY_INCOMING_END;
> +}

This name is misleading, IMHO.

The code means "we passed listening phase" but the name implies "we're
listening".  We can add the "incoming" into that if we want, though.

-- 
Peter Xu


