Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F1687014
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNK0c-0006kL-If; Wed, 01 Feb 2023 15:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNK0A-0006g2-W1
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNK04-0006jv-7l
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675284395;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UhoW1Rl89YyqefCw19L7KsTDj/dagdWKUA9x2Lip+JE=;
 b=ZMPXDgXLfN3cbVsxo4q9SaKx5aLs4wR547fYdLpQHM2R1S8doTJJl5PneN220ziTIbQsQ2
 fmXkGRUVj+t1NdOh8eXKPYfJQ97KG6KDVMgCc9CA8prNDO2JvRrHSJHpAg8C4+MPl8B+Of
 yfyg5LqnRN3lVlR5gJcCMkEfAT2X8g4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-dgyFdRvFPa-g7hWT_3x3bw-1; Wed, 01 Feb 2023 15:46:34 -0500
X-MC-Unique: dgyFdRvFPa-g7hWT_3x3bw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h18-20020a05600c351200b003dc25fc1849so10802224wmq.6
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UhoW1Rl89YyqefCw19L7KsTDj/dagdWKUA9x2Lip+JE=;
 b=DYn5VCJWGzT5RX6YVGPfggKJmlAAOL9S4ePgwFSl091AJULzcZXaHDhq30QDlAVQfh
 bjmVCeUFpTYJHf/OoKHZ6uV4l+1Q5PzHGe5GfK+1H7LePi9X2FzSFhtETkgnWlq1vwjy
 u05lysyFUD5DFIR0YdyaXOz7holFVTBAJfFMOnfYZ9ywYetCzv1rpqdXsCyx5I0c+ztG
 nUzKRxacoxYFqRuwfetfWhCckltk3sUQymFdW1eqG2v16WEioRCc+9jI6e96m1c1gEUj
 VcDHpquPRXqgKoAd2ripTPFZjT129QZduivjW9tzMNeMKKVDKIvwD85Ikf7Li/AL57dm
 L3aA==
X-Gm-Message-State: AO0yUKVehz9j7NO6USZABufNEEpzYFTzjFJIddX5IUWJGKUnAZmZdS8H
 spSqScikWy/IoMKjKIGyg792njsdTZS+FQutNI2FKBXXjiygFfzqBSnitysszKZ/uqE6r0XXso/
 FClpoie9JhbvhRow=
X-Received: by 2002:a05:600c:3ac8:b0:3da:1d52:26b5 with SMTP id
 d8-20020a05600c3ac800b003da1d5226b5mr160966wms.14.1675284392928; 
 Wed, 01 Feb 2023 12:46:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8KE6Wl8pVL+8nJm5g0goJ6ktEsdxHOwtd5L4rmH+fGs7l7dnq47KLa3+PlYSLKTlDf7RtgMA==
X-Received: by 2002:a05:600c:3ac8:b0:3da:1d52:26b5 with SMTP id
 d8-20020a05600c3ac800b003da1d5226b5mr160958wms.14.1675284392697; 
 Wed, 01 Feb 2023 12:46:32 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003dc1300eab0sm3128663wmq.33.2023.02.01.12.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 12:46:32 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  pbonzini@redhat.com,  kraxel@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  marcandre.lureau@redhat.com,
 dgilbert@redhat.com,  mst@redhat.com,  imammedo@redhat.com,
 ani@anisinha.ca,  eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
 philmd@linaro.org,  wangyanan55@huawei.com,  jasowang@redhat.com,
 jiri@resnulli.us,  berrange@redhat.com,  thuth@redhat.com,
 stefanb@linux.vnet.ibm.com,  stefanha@redhat.com,  kvm@vger.kernel.org,
 qemu-block@nongnu.org
Subject: Re: [PATCH 18/32] migration: Move the QMP command from monitor/ to
 migration/
In-Reply-To: <20230124121946.1139465-19-armbru@redhat.com> (Markus
 Armbruster's message of "Tue, 24 Jan 2023 13:19:32 +0100")
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-19-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 21:46:31 +0100
Message-ID: <87pmatuna0.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> This moves the command from MAINTAINERS sections "Human Monitor (HMP)"
> and "QMP" to "Migration".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


