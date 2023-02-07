Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2068D1B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:48:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJdp-0003FK-9s; Tue, 07 Feb 2023 03:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJd3-000335-Jw
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJd0-0004DG-Ty
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759619;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wFq7kmC2BmyA/YkkL4ElEZC5rjNbV72MJ1ja64UWuY8=;
 b=ZgDaHIwD5kGoBkIxBu2spLWG/h5luRat1WWG0U3H10Z5Db2sf/oGvzh3CKYER64psn6t0Z
 fKdFqSVzaobeR8pcj2nnrQWDsQ4NFw/xuPGgCJ0Jovu1lL/ipeilASgQI38mZo2t3abCK5
 UtOCdUls97OVp6kV4pMA3LR+9KE34Ok=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-4mZa3Ui6PjaenFqO4dBqig-1; Tue, 07 Feb 2023 03:46:50 -0500
X-MC-Unique: 4mZa3Ui6PjaenFqO4dBqig-1
Received: by mail-wr1-f72.google.com with SMTP id
 i9-20020a0560001ac900b002bfda39265aso1864532wry.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFq7kmC2BmyA/YkkL4ElEZC5rjNbV72MJ1ja64UWuY8=;
 b=d4tRniSD8aFRmTA5w4MDAfmLzzgI2NYhCxY+pOyk6qEmluh/OLhh3mhEc9RSaHqLqp
 aZPQOMv1Pl4QQcWKBWqoAcoM4I6L3J0CECyo4rT/L7kUeE1+PSEEKS+bGmkQfXv2u4iS
 UG+fSBjdSmTMip1xJ/HvXPUHUm5DEZ5lwjCR0bXoJoyCo4f0tkDx57B0thJ/jcDORYN7
 0OD6F64N0oUHyU43MyXTwZx+2m4276puezLn5AgmKmdFosqBX//AWJIeXgfK8/uLcj4q
 GSpbckNq6K3sWMXlwpeBDGTL4PYpTaV3jFpcVAjzSidMXjnxBVSzf56/U9OWOaUVcwdl
 SrFg==
X-Gm-Message-State: AO0yUKWRQON8rN4sn34UMKImYqy+iVMtzhs7yrepC6ErJIsZp8EzmDGH
 Jl4KmHDgHBspUdu2+Z9B/plMdfTzEQDibGXyEC7GfG8jiN/802H6czcWkafIg0gnIrBMuuP/cxV
 B0Rotos1cqBN+L/E=
X-Received: by 2002:a5d:6950:0:b0:2c3:f7f1:e703 with SMTP id
 r16-20020a5d6950000000b002c3f7f1e703mr709642wrw.67.1675759609471; 
 Tue, 07 Feb 2023 00:46:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+Y2vVJvhhDfMs1mYHFWWxrYeCPoeBzZRiNZd7batPu7cjOrGE2PmHBtQ66eQh/f0xj7otZeQ==
X-Received: by 2002:a5d:6950:0:b0:2c3:f7f1:e703 with SMTP id
 r16-20020a5d6950000000b002c3f7f1e703mr709627wrw.67.1675759609330; 
 Tue, 07 Feb 2023 00:46:49 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfdd42000000b002c3ec1fbc0bsm3538315wrm.94.2023.02.07.00.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:46:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 03/12] dump: Assert cpu_get_note_size() can't fail
In-Reply-To: <20230207075115.1525-4-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:06 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-4-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:46:47 +0100
Message-ID: <87r0v1c16w.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> The only way cpu_get_note_size() can return a negative value is
> integer overflow in the non-stub versions, which is a programming
> error.  The stub version is not actually reachable, because the
> cpu_get_dump_info() stub will fail first.  Use assert().  This gets
> rid of another use of QERR_UNSUPPORTED.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


