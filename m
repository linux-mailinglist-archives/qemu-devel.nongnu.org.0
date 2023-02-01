Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E9687015
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNK0b-0006hU-C1; Wed, 01 Feb 2023 15:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNJzf-0006bi-Ta
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:46:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNJzd-0006ap-Ew
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675284368;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OFFnJKZb8PMi7/wXr3GZyOfNFD62OL/lS9nRJ+QrMX0=;
 b=P89zRspyZvvtzKPxi28Mg1iQItat8mPDX98SIFTEQFveAbDgrK1o6VHLmkEz6M0eGiOvG4
 gRMOhrxCTLBx2lmTE12ZQOJ1fJ3zTPNRj9Xes52twqEh8BXmPWPkukpP0tq1c7tL33/Z3u
 8Xw8UUParjb5fDsMl0HSSb9El+WciuM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-qx0vKwGZO8eoHpaOx2CTXA-1; Wed, 01 Feb 2023 15:46:06 -0500
X-MC-Unique: qx0vKwGZO8eoHpaOx2CTXA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h9-20020a1ccc09000000b003db1c488826so1699138wmb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFFnJKZb8PMi7/wXr3GZyOfNFD62OL/lS9nRJ+QrMX0=;
 b=GKfZiywck1Ffh7WX4X5exRZTuewqEAsbXAvx/m3GHHavDXNarzlk7LhnnMtXVDCiU5
 nJ3FtOaMwyMmFjx3Zrz4OGz0e1RS+iNKLBP6iEXEO/fQeB8+hY9YaHE8ZV77FYhSISJ2
 8nkalgMF/11D5RNLpOWu/nqECPYlLMOK0YfvJUdZ6cjgwiY9Dx2x6rXfnvmSjEwABAuq
 dH+L/Ej6NRzEd4PCo00AE7Uwi4HGUqx4PmDClkO4seBLAIxKJIu7qbXXj0rWL4+I+ZuR
 xUO+QumiWg4GitEyzx5nmiekJlCpKKd30p3EzlTuHgI1szl85dHTMRjH3nnRi3DXuB4l
 Lm2Q==
X-Gm-Message-State: AO0yUKWetbXYSth7FK6bVhvC/esqzMTTwNk80qLd9KpQmmfgjjfaNkS0
 abJgZEmkWW8hcjljAKUBRNmpARz8IhfAqnbN+UHJabP3eNfme0EN+ubaGZ/e4UB9K/ENIoVE9+9
 i+iOM99kFAFFW2jU=
X-Received: by 2002:a05:600c:468b:b0:3dc:486f:1552 with SMTP id
 p11-20020a05600c468b00b003dc486f1552mr3270429wmo.34.1675284365734; 
 Wed, 01 Feb 2023 12:46:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+RAwtEfrO0X//rLIy0fI5MAqZnGSrHIIQMeD+80k3zENA784Wo2s1SpiGytC7pL6ozqe4h4w==
X-Received: by 2002:a05:600c:468b:b0:3dc:486f:1552 with SMTP id
 p11-20020a05600c468b00b003dc486f1552mr3270396wmo.34.1675284365395; 
 Wed, 01 Feb 2023 12:46:05 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c358a00b003db1d9553e7sm3120300wmq.32.2023.02.01.12.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 12:46:04 -0800 (PST)
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
Subject: Re: [PATCH 17/32] migration: Move HMP commands from monitor/ to
 migration/
In-Reply-To: <20230124121946.1139465-18-armbru@redhat.com> (Markus
 Armbruster's message of "Tue, 24 Jan 2023 13:19:31 +0100")
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-18-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 21:46:03 +0100
Message-ID: <87tu05unas.fsf@secure.mitica>
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
> This moves these commands from MAINTAINERS sections "Human
> Monitor (HMP)" and "QMP" to "Migration".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


