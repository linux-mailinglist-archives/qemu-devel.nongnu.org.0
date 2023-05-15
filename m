Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362A70298A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:51:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUrh-0004bZ-M0; Mon, 15 May 2023 05:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyUrf-0004bC-Lw
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyUrd-0006r8-9p
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684144292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7MpMXVlMKyb8bCL9DosR1CVGe0Tr1uaPsqpU5pT3FiU=;
 b=c5J+WCChznDf7V02qgIMROJyqOjmgPj7ZbVZRoC+t10zOop9rWoXt+wrf5Gjgx9KK5rg5E
 F8FvzlEBa0GZfPSsM2YENxKkA1B7Nu2FVrmMolkzu8uvVz6R1J1rApcQZnDlaqpHUeeGvZ
 1DkNQpd0KV/x2Aw/FwYSQXxydHqzg/M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-dW1G4q_RP3ex866WPUqvDA-1; Mon, 15 May 2023 05:51:31 -0400
X-MC-Unique: dW1G4q_RP3ex866WPUqvDA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-306311a2b99so4880985f8f.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 02:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684144290; x=1686736290;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7MpMXVlMKyb8bCL9DosR1CVGe0Tr1uaPsqpU5pT3FiU=;
 b=GMyfUlQ27utsQTqKekuNWFo6BGBhHLiuMXkSk43UZnrH64EBXF8qDjSziaSFxf0IXr
 VCQAiRLUwwXQsMJ6zma/ZKzeKncF71bOkL4/m1MGa2oBv4YQ3UMyquZdBMDIPVT13j+U
 IO+/h9i0E0//RiGWzyAPUSgchYgHOo3eRW7uhkje/cX6Mh4HTrb5kzCkqdDiv/uQJkt1
 QMZdJdQhhoXxBNZlfu9474Lue60o9jRvQqvES3e0Ew4tD1vlDCTHTjkIkrbvLDotqPqJ
 2XLkhTBD9ttYwtwOnEC+74ZXboGFsdhjbg+0I/Q+CSD4xoD0a024VISQfoteiMrqd86x
 G15g==
X-Gm-Message-State: AC+VfDxGoOt9PA7O27JjbyojqB4IywxdaBV+2JxOGp6i7bOhLhf41chb
 imdBglqjW4JDiIcCC8+HeGXpxckbJwqGX1gn1A/6DOZBv8YeORElESo41ccFwXhSpt7GI6TjpDy
 9JujcRjWyXO+mfEw=
X-Received: by 2002:adf:dc04:0:b0:307:a33d:d054 with SMTP id
 t4-20020adfdc04000000b00307a33dd054mr15125515wri.49.1684144290021; 
 Mon, 15 May 2023 02:51:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tOI3//FwiVZetyNCbfBwkT4GV/FF9fdYyo0m5cVYCVniXvU+HNklCZDzjx0KWr8H9xQQtPg==
X-Received: by 2002:adf:dc04:0:b0:307:a33d:d054 with SMTP id
 t4-20020adfdc04000000b00307a33dd054mr15125504wri.49.1684144289743; 
 Mon, 15 May 2023 02:51:29 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b0030771c6e443sm31703032wri.42.2023.05.15.02.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:51:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 4/8] migration: converts rdma backend to accept
 MigrateAddress struct
In-Reply-To: <20230512143240.192504-5-het.gala@nutanix.com> (Het Gala's
 message of "Fri, 12 May 2023 14:32:36 +0000")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-5-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 11:51:28 +0200
Message-ID: <87sfbx2a8v.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
> RDMA based transport backend for 'migrate'/'migrate-incoming' QAPIs
> accept new wire protocol of MigrateAddress struct.
>
> It is achived by parsing 'uri' string and storing migration parameters
> required for RDMA connection into well defined InetSocketAddress struct.
>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


