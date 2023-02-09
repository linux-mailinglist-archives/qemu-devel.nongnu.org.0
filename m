Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286069080B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 12:58:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5Xk-0006d2-LB; Thu, 09 Feb 2023 06:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ5Xi-0006cm-LE
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ5Xg-0007FH-Oo
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675943803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PF0WmP/1qT6BVFp3oEU4jcdyWnjCqE/Lftvsmo0XNVk=;
 b=hKxQE9Jnx5rn2hP5HS/LPHuZ78gyRbFP1KTr8nZeVB4ZmA88AJxlvVOWzuR5ciAggQqt8d
 WzjBbUPwAxQfVzb9HznUarS54iepkWbicj//4k/MgCUDyXAQQ0auFmO5c271tgtMg9L5gb
 aooyaOl/RJt9NLyqBSkvJ3W146yjliA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-8FOy6OEQOYejcE5w5Swb1g-1; Thu, 09 Feb 2023 06:56:42 -0500
X-MC-Unique: 8FOy6OEQOYejcE5w5Swb1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 e38-20020a05600c4ba600b003dc434dabbdso2718043wmp.6
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 03:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PF0WmP/1qT6BVFp3oEU4jcdyWnjCqE/Lftvsmo0XNVk=;
 b=oAspGQnYJovyF6S3WUR00+4ed2OvJ6MOleYUmldYG/GACXX6rdvkj7IoMLiE8a/AmG
 kSuwUp7y7lFILONXFB2np/6VGzHQLw60UqXq5OFhfwSfOj/BDw2fm2n6lsiqP5bIEhMV
 vI1G+3sgkzRKXGFIhMCYa16+b8vh4mk3+m5FWaGY5B1QSw9hkZDXncg0nwOLpx3lSeVT
 03/ixqJUVejIHxG/qSSoSaHH/XbpUeJ6GyofJX/lCm39toPPiYLleT9+IgPXpzt6VI86
 qgoZ0BNKhkQkaKiHpTqlUooKRCaSaDe9BieHCJyFqFSMO1si8nxntBwYBA1lBBCbsg1d
 UKkw==
X-Gm-Message-State: AO0yUKUT59Y16pwJ60OGm5vQI6T00f/rhGnNCMs/kw/M0PfRtJOKgTDu
 WwhXyDBlZqZAznobmwCLvn33NRLT7lOm+M5E7WsFIT7irrYGZ8qY5UeDwNjXuMtR9hcUgtCJQS3
 9ZmFChs5oxEaGzVg=
X-Received: by 2002:adf:e4c3:0:b0:2bf:d2fe:8647 with SMTP id
 v3-20020adfe4c3000000b002bfd2fe8647mr9691288wrm.70.1675943801114; 
 Thu, 09 Feb 2023 03:56:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8cM9Q7vBlO3E815WcVeT91SrkyoOLVnLXWfTS4Aiilo7N28j3ied+BhvMg4d1Y2//AYUfy+g==
X-Received: by 2002:adf:e4c3:0:b0:2bf:d2fe:8647 with SMTP id
 v3-20020adfe4c3000000b002bfd2fe8647mr9691265wrm.70.1675943800901; 
 Thu, 09 Feb 2023 03:56:40 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 s6-20020adff806000000b002bfd524255esm1068000wrp.43.2023.02.09.03.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 03:56:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v3 1/6] migration: moved hmp_split_at_commma() helper
 func to qapi-util.c file
In-Reply-To: <20230209102754.81578-2-het.gala@nutanix.com> (Het Gala's message
 of "Thu, 9 Feb 2023 10:27:49 +0000")
References: <20230209102754.81578-1-het.gala@nutanix.com>
 <20230209102754.81578-2-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 12:56:39 +0100
Message-ID: <874jrv6oi0.fsf@secure.mitica>
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

Het Gala <het.gala@nutanix.com> wrote:
> renamed hmp_split_at_comma() --> str_split_at_comma()
> Shifted helper function to qapi-util.c file. Give external linkage, as
> this function will be handy in coming commit for migration.
>
> Minor correction:
> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
>
Reviewed-by: Juan Quintela <quintela@redhat.com>


> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

But I can't find this reviewed by emails neither on list or in my INBOX.

You can add this lines when someone answer with a mail that explicitely
contains them.

Later, Juan.


