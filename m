Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B8525640
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 22:09:53 +0200 (CEST)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npF8C-00068P-1B
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 16:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npF6W-0005PG-Jk
 for qemu-devel@nongnu.org; Thu, 12 May 2022 16:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npF6T-0007SU-J7
 for qemu-devel@nongnu.org; Thu, 12 May 2022 16:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652386084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ai6bHZ0D8VU2w+Gina0dEcQ0qcUbbzqh13EDmUbyp5M=;
 b=N3LDXi6QCE00IdLtYdO0bmsqlahwHJs9RBN+FJCNoe6nICUfCUMVdssZAwCIbSGddvhww1
 0sk5BN8STR8+19hIw6UAEflWVQWZrriP6tGMbgU4yuO9TGF6IudR1m6v54m7Xr9LkjO+rP
 a8M1XaC5xvcqKKtaUAgLbZjPS74yCNU=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121--KofvVwpOdGHa4o8Dt8yTQ-1; Thu, 12 May 2022 16:08:03 -0400
X-MC-Unique: -KofvVwpOdGHa4o8Dt8yTQ-1
Received: by mail-io1-f70.google.com with SMTP id
 s129-20020a6b2c87000000b00657c1a3b52fso3653260ios.21
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 13:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ai6bHZ0D8VU2w+Gina0dEcQ0qcUbbzqh13EDmUbyp5M=;
 b=BVwGHDxY/mjSci8MZxFD1/spRkOL5/waVcSdNc/BXSZAJ6wkOucpTNDuTtrVlothFg
 s3sQYIiQJpTL6/cuc3Pe2EeWH5qY0BbOnSMlH6PU8sZwnWU1+ICNstmwlRRYy5qoK8I1
 gbDcxKmCRBjfDQ4v2GWuSLqNtyK9/Bq3AOz2LlS2f2CL55djazAfiePDp1pvv1zRgT3v
 tsv5q02P/nnAUJ4abAB6t7suT/uUOw7UXm9mNsaN4B6OWjgmuDN/NmKMIyFovBA0QMZA
 JiBWDsovx+7DrcHZwLG3Ltanp4JvVbKI6jJuo5ARBgom+CttHY2+ONvWorPf8VETkV0J
 5rgw==
X-Gm-Message-State: AOAM5318KgwjgOqgHv2tuHqeLKlf/YPCg0VfmuSIRCeFWoq7k+nkEaNx
 k2sR5pYHksLoYvODJHYzJ8SNytTTzSZl9AUxUf9qzrGG95gk3uszSowXcpDWoBr8dTqAXUcf8jz
 pfBZ5XYIG7rT9IZ4=
X-Received: by 2002:a05:6638:19c4:b0:32b:6436:f1c9 with SMTP id
 bi4-20020a05663819c400b0032b6436f1c9mr849437jab.303.1652386082766; 
 Thu, 12 May 2022 13:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvUW/q8Fw0QvelqCyn+T8JhJMMiDV1qVVSGv8dGrPnkP/YJeupa8u08yI9J617dTo0voefVA==
X-Received: by 2002:a05:6638:19c4:b0:32b:6436:f1c9 with SMTP id
 bi4-20020a05663819c400b0032b6436f1c9mr849378jab.303.1652386081046; 
 Thu, 12 May 2022 13:08:01 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 3-20020a056e0211a300b002cf5aae6645sm111349ilj.2.2022.05.12.13.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 13:08:00 -0700 (PDT)
Date: Thu, 12 May 2022 16:07:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v5 17/21] migration: Export tls-[creds|hostname|authz]
 params to cmdline too
Message-ID: <Yn1pH2jRCOzJpM9m@xz-m1.local>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-18-peterx@redhat.com>
 <Yn1L4eOEBMVvnYXH@work-vm> <Yn1aiRUKwgBczrlP@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yn1aiRUKwgBczrlP@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 12, 2022 at 08:05:45PM +0100, Daniel P. Berrangé wrote:
> > > @@ -4372,12 +4375,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
> > >  static void migration_instance_finalize(Object *obj)
> > >  {
> > >      MigrationState *ms = MIGRATION_OBJ(obj);
> > > -    MigrationParameters *params = &ms->parameters;
> > >  
> > >      qemu_mutex_destroy(&ms->error_mutex);
> > >      qemu_mutex_destroy(&ms->qemu_file_lock);
> > > -    g_free(params->tls_hostname);
> > > -    g_free(params->tls_creds);
> > 
> > So hmm, why is tls-authz special here?
> 
> Pre-existing memory leak bug IIUC

Right, and there's one extra paragraph in commit message explaining it (per
Dan's request):

  This also fixes a trivial memory leak for tls-authz as we forgot to free it
  before this patch.

Thanks,

-- 
Peter Xu


