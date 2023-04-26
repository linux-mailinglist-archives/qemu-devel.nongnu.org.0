Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C406EFB59
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:50:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prl8i-0007nM-GD; Wed, 26 Apr 2023 15:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prl8g-0007n9-NF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:49:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prl8e-0001CU-F0
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682538554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Js1CwFwHsMwVMSQqDh3DN7XFPcvFOVGtmQm3y50Vfu8=;
 b=Ov2+AkNcoB6PyKYCeq/ETLlufU8RPiUczz3fMx7kQzyjokW0NmV9/K4ND6qHbeW4G/PBgG
 9TPYgMnD0VAjRamr1XL5NR5P29/92vG8O927s7uytZ4busOc49+gOK/psojTt1DTrWBgKY
 Nk7bKtuvK8as0ItI7I7ytjiqNvfM8nM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-LtF1YspZPpG2bJahYz5e0A-1; Wed, 26 Apr 2023 15:49:12 -0400
X-MC-Unique: LtF1YspZPpG2bJahYz5e0A-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ea572ef499so5257206d6.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682538552; x=1685130552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Js1CwFwHsMwVMSQqDh3DN7XFPcvFOVGtmQm3y50Vfu8=;
 b=SZhaA9gV7FZApxE4JFrvb+jF/EQ9LCytOIssLnvDK3sK3hp1NEhG+MMOpRaiyNS+W5
 XTbxO3S6j6W0Qpu2UB6a/SkHYl/fYBZfBS9pzXwZtdaAtmTHX7dkkx1BMoOFLUp8UE//
 hRzXsOP90oWlPufiZvL6n9qBLN4XUbeO/bedOWkf4EDwqcwMtfhbYpO59dmVEKLksf88
 d8OB//nPRVolswxjaek1YYjQIs9bxnO2WmAQh5zYBfUqPsy27HM+u9rSPFizAEdsDFA7
 0RxCN1o23L/TowiuhXn/MjUmbqm9phc+vmegBJFusbZElfGpZD0X2StJ8N28Iu8T35iD
 tvzg==
X-Gm-Message-State: AC+VfDzRIBfJlIZAD20A08Z8ditx8nkMgFWNzfuG77r+eNER4LX/jaJB
 0WtoG/7rvv04lifmTSYF45dIzr/9yKqsQ/0N8J6ZToHMCaf4lHnI+x7QgvriFwz9CBcOOVlYP8s
 2LTcj8Knr0VrWGFM=
X-Received: by 2002:a05:6214:21af:b0:5ac:325c:a28f with SMTP id
 t15-20020a05621421af00b005ac325ca28fmr10852300qvc.0.1682538552394; 
 Wed, 26 Apr 2023 12:49:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+4aRg7XbTI47dpEhrLFHT5bVTV7SYBvAPa772RsJFOmEljplQOOHMIclsjXqIh0neSaIpaA==
X-Received: by 2002:a05:6214:21af:b0:5ac:325c:a28f with SMTP id
 t15-20020a05621421af00b005ac325ca28fmr10852264qvc.0.1682538552076; 
 Wed, 26 Apr 2023 12:49:12 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 ru5-20020a05620a684500b0074adc37ec46sm3662517qkn.84.2023.04.26.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 12:49:11 -0700 (PDT)
Date: Wed, 26 Apr 2023 15:49:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v9 0/3] Eliminate multifd flush
Message-ID: <ZEmANhN2odX7brKI@x1n>
References: <20230426181901.13574-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230426181901.13574-1-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 26, 2023 at 08:18:58PM +0200, Juan Quintela wrote:
> Juan Quintela (3):
>   multifd: Create property multifd-flush-after-each-section
>   multifd: Protect multifd_send_sync_main() calls
>   multifd: Only flush once each full round of memory

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


