Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D23CFCD7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:01:17 +0200 (CEST)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rFE-0004jf-T4
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5rDo-000432-4J
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5rDm-0001RH-Pr
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wpkHPeaLMw8+hz7JO+MG27Xs9zeT9jRVK4SnV8r0zQ=;
 b=CanJQNg7AznAI4umz7s9Y967VOshQILSXC7v02trn91PJyIj3sZusYqHLQZmuMIhmit7pa
 /C52ryA/1ZiJwXwLTfXCpEUoSIK1p/jro3ZE1Im4jD3w8XiXI+sInwpBmfyVIbD5UMLOzJ
 4GucieKPo9FeNRu8lTS4VcIPQLUplzI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-c6ck8UXNMqem5D5AYJ_b_Q-1; Tue, 20 Jul 2021 10:59:45 -0400
X-MC-Unique: c6ck8UXNMqem5D5AYJ_b_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 g13-20020a05600c4ecdb0290242a8f4cf9cso1344403wmq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 07:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2wpkHPeaLMw8+hz7JO+MG27Xs9zeT9jRVK4SnV8r0zQ=;
 b=RnA2avcMVWeu+8fLCdDLkdxQb3L40uw25pRS4RMH+rNGf3Nz+2rywxrcnw9vPXacJY
 4jJT224LmfqzJoLG9+pSngF7Jz7o+RCB8ewjuAr4pUOjb3wYYLrRkmAPrt6Eg4Zi7JA1
 6AsaViq7P/k5zNAwNrX6J18/OraCJkfMcNGDP7z/X4ju8E6xG50s9J7OheEIbJSyg+vg
 WYOgFh5Lm3DcOUVcZSDV5BDky0oFNtB32Rgovg1t89V9AdW2c0i62IqKoTVvk1AGOyoQ
 r41N5r0xLI5Uc8a5a65zzSQH2bNTuD90oA+LJET9iRGIHmrNF2kZsJp3po44cGvaMAPe
 cKGw==
X-Gm-Message-State: AOAM530+XTNrncwH5QR3RkAki+xp+nfPeEqKqrgOp3eTPCL6Ftj+ZI35
 j87g65KEUmFXIoyevUWWIuNLrtf4iS4bbtj48MYkUUDp3HDRb7hSllpah9xdfrqOWssDrr1Pvyj
 whUGsdNjy3nIUjiI=
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr37842507wmg.25.1626793183954; 
 Tue, 20 Jul 2021 07:59:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpdtu0JWiYyzbk1Z+MNKahoyD/6JALglgJU+axghI7qQjB9opz6GLU+6Ugv9zlE2HqXgNbfA==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr37842486wmg.25.1626793183759; 
 Tue, 20 Jul 2021 07:59:43 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id w3sm23832366wrt.55.2021.07.20.07.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:59:43 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:59:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20210720165942.16481c19@redhat.com>
In-Reply-To: <20210720151640.2d682f57@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
 <20210720151640.2d682f57@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 15:16:40 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed, 30 Jun 2021 15:07:17 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
[...]
> > +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> > +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> > +    const char *oem_id, const char *oem_table_id)
> > +{
> > +    ERSTDeviceState *s = ACPIERST(erst_dev);  
> 
> globals are not welcomed in new code,
> pass erst_dev as argument here (ex: find_vmgenid_dev)
ignore this, I didn't notice that it's passed as argument.



