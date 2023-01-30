Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1E568058B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMZZ-0001Aj-Nd; Mon, 30 Jan 2023 00:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMZY-0001AZ-Gw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:19:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMZX-0002Su-9L
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675055954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vF3+JIYd7yIN4ZmK/vOh8ZEugzNv62FXTZjKJrxM7rI=;
 b=fpIAr4LxUD0drxpy97rr4kfd0Bx1kIzuJZ6T9kCXHDJS2JMn/w2I2Jhfbj+aarfoEVXGgO
 C+h55rqGPHBWROoyKsHcY/dmKfsHPq+uYXev34keeVqASETe6uaUAY41iyUrpKwTiEY/Ju
 i7pbDU0yl+lq4n8pKNpMJO5FJu3OmKs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-9Y9BvyFlOkGSHILP7KPRlQ-1; Mon, 30 Jan 2023 00:19:11 -0500
X-MC-Unique: 9Y9BvyFlOkGSHILP7KPRlQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h9-20020a1ccc09000000b003db1c488826so8929085wmb.3
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vF3+JIYd7yIN4ZmK/vOh8ZEugzNv62FXTZjKJrxM7rI=;
 b=rRm4zl7CpzyEnVJnnrfcVDfgHjjBdq9jNQcXJ6J+iHrH9oUAZvw+ao04jb4A2AYjTU
 IiTSYw8C3gelTLdG/eOrVF6FAz39sAbOoHTirisCBnT2ptF6vNuQvysf2gvNk1P4VtpL
 lW3VrpUClb4am55wQ6e36Az2dgGbzLcjs07gpSH8ss9PIVhN8vOPAqi2DqvYTQmjSxNk
 MvZx3N3JO05vBxXxHtk1hFByNOvZOuJ3SAsaBHo3b6rdceZU3jp26TRzH+PAIp+Jrfe7
 qx2bX1fpFdl4wbtIbq5m/NUiljJ82RkqFol1IssBK0mQf6EfTWveWyDcqEIKjXRpa2J7
 9AYw==
X-Gm-Message-State: AO0yUKWLXcan19+ozSVL0FVDWXNWDKgEMPNNZie+nks7+F4vAhmZbyvD
 qfTj8cO2M3LW5wct1oRi4S8qr8qAHb4lXIsVRLhN574UG6o9N+X4LTHYUMN7v97zUnvhr49o5sZ
 H75QOp2VUbdhOEiI=
X-Received: by 2002:a7b:cbc5:0:b0:3dc:59c3:9020 with SMTP id
 n5-20020a7bcbc5000000b003dc59c39020mr1924956wmi.8.1675055950435; 
 Sun, 29 Jan 2023 21:19:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/RkjzKM6gTz6ydPX/MQc2xordWYuyKXKgti2h5/iwASRPO4I5f90se693Vo2R6khZuf4MEOw==
X-Received: by 2002:a7b:cbc5:0:b0:3dc:59c3:9020 with SMTP id
 n5-20020a7bcbc5000000b003dc59c39020mr1924942wmi.8.1675055950221; 
 Sun, 29 Jan 2023 21:19:10 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k28-20020a05600c1c9c00b003a84375d0d1sm16344413wms.44.2023.01.29.21.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:19:09 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 13/21] migration: Add migration_ram_pagesize_largest()
In-Reply-To: <20230117220914.2062125-14-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:06 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-14-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:19:08 +0100
Message-ID: <87mt60ioqb.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Let it replace the old qemu_ram_pagesize_largest() just to fetch the page
> sizes using migration_ram_pagesize(), because it'll start to consider
> double mapping effect in migrations.
>
> Also don't account the ignored ramblocks as they won't be migrated.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


