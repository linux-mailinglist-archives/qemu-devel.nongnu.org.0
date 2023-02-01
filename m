Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B961D68692B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEXQ-0006Yq-0L; Wed, 01 Feb 2023 09:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEXI-0006Oi-Ki
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:56:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEXG-0008NK-Tt
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675263390;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QDjh5Wuuibkz1mKc6UxhIpFnijGjRcixbJJ5LSWbKTY=;
 b=USnooXjKkoL6l9SI+cjpnfDDTre7x54B02N0w9ulYdENJMHS7ndllCZPGZ53YP8bO5aqBm
 cq+OBnmhq+7FmWP9rZN0DvG2wHmGxMBib0+WwiajEWk8IMCtgCTYKIRySek09XrNisMgDq
 STiyviGdocfC6uuxLEH8VK5lkDGzlMg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-IuOt07JtNQC1OqEsxHNHnA-1; Wed, 01 Feb 2023 09:56:29 -0500
X-MC-Unique: IuOt07JtNQC1OqEsxHNHnA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso1104059wms.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 06:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDjh5Wuuibkz1mKc6UxhIpFnijGjRcixbJJ5LSWbKTY=;
 b=Jm0FI3KLxLJSfa7hn4EtGL2iXewjfIKu86G7b+i2TIWHKTe2GTVBJVEicFK4Hwen6P
 Du5VdQsCpzWNBV2HvXZTHT6qQ0VMHIX9v599yRPiFpJC0Y24e5v4kXDtySD3Xx10HFi+
 PUF3rs4cC2JnjfSMrksrGCh512yI/37naPtBQnEB3txn/n1xQbWQ2moJEsHRpbSuK5oJ
 9kPg77ScPPz/f87NtONdddOkJ5dymq8WRfPZD3X+QJFQjlLcsEV+Aqw+fbo6OvSpVp2i
 b/10QIa3RKXMVGBu7l1yZ1hnZt/YQddkcgS4NrUTRrHV3nsNBFfoSW8licgZtn3lNlNY
 XMhA==
X-Gm-Message-State: AO0yUKV+o/t6ycGj5sCuuOYBZbrYkl7Dm4mUUKqCeqcNpKj7mdycFEz9
 hmNM+6UXE9wg4EDvbDWRE1tiLyxe256SkPfvCy4OFbEXdjsabMYPWxmM7jrCexThVXHK3Ij4yn8
 UxSrK5ck5Vb8xEYQ=
X-Received: by 2002:adf:ae09:0:b0:2bf:ebd0:2e46 with SMTP id
 x9-20020adfae09000000b002bfebd02e46mr1913955wrc.65.1675263388009; 
 Wed, 01 Feb 2023 06:56:28 -0800 (PST)
X-Google-Smtp-Source: AK7set88bGcbmbl4KpvQkncrTi/foK0ADY6dzWX0FLFyLxsykmiXs9b7zA5Se8hmrl91rNClF4Damg==
X-Received: by 2002:adf:ae09:0:b0:2bf:ebd0:2e46 with SMTP id
 x9-20020adfae09000000b002bfebd02e46mr1913939wrc.65.1675263387852; 
 Wed, 01 Feb 2023 06:56:27 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 e4-20020adfef04000000b002bded7da2b8sm17555992wro.102.2023.02.01.06.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:56:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  lsoaresp@redhat.com,
 Peter Xu <peterx@redhat.com>,  "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 2/2] migration: check magic value for deciding the
 mapping of channels
In-Reply-To: <20221220184418.228834-3-manish.mishra@nutanix.com> (manish
 mishra's message of "Tue, 20 Dec 2022 18:44:18 +0000")
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-3-manish.mishra@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 15:56:26 +0100
Message-ID: <87y1phzb6t.fsf@secure.mitica>
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

"manish.mishra" <manish.mishra@nutanix.com> wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses read peek to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


