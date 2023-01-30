Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A8680558
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMJ7-0001e7-Om; Mon, 30 Jan 2023 00:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMJ4-0001Zo-1w
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:02:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMJ1-0008RI-LX
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054931;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wlKH5kza8gKbA6Q29GQlwEV51OJWc9iQ1gZxmj1qK7s=;
 b=Gi/3uiSR1XWN3zFuH34C8//OqzqaZ3pHyLY046Ky9Uqn955gFWWQzJMjpqyq+txR5S/ED0
 JKRPPFFhsqazd4nu7nmkpT+2W+Jx3GND2sg6QTTDWKZTMqLEsRyJF0YyCZgGJ9MqWOh/eU
 zF3OqijWf6HJFog4Kl60DpK0o/3Ajpw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-zeh9xIlsONWVAw7DhUaMNg-1; Mon, 30 Jan 2023 00:02:07 -0500
X-MC-Unique: zeh9xIlsONWVAw7DhUaMNg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h17-20020a5d5491000000b002bfb1375c4eso1570085wrv.17
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlKH5kza8gKbA6Q29GQlwEV51OJWc9iQ1gZxmj1qK7s=;
 b=yzjjw/WeGzed4a6xSo5277d2eD6YZ6V1z4ABmDwaI7TE6hoe6KRcbBBHwWadri2+4P
 fOt+F6OpXsPjnaQAPKpHHgHM5kR8qQ8nh7QSEn24mQkepa4CzjKY4JAr7VUUPDNy9iZt
 d/q6aZ9FHCaX4TqxnSucU6xRSKtDDW/jIb0WJYBdOUugD0hIARNxsfIwvN8ncxHQ2xFj
 9CiAT7I5iuVhKbgSbqrd4W7Q38w69ARCc1E54sT2mI36jP+mUYERD7DP5OEm5khtsIwD
 TFrWrPYsb4gbNtJg3yhKAUX324omq4jydWeQEkYGHeRStsQpum2uoOfcHToGZqn047dE
 hGMQ==
X-Gm-Message-State: AO0yUKUAGe16auN81A9Nwt5iRfnOOn8SUYK92MwZEZVKWteByegLBR2Y
 /LTpHDuLsRKy0Wu8in4ppNXzjTR6u+4+y0DHYFXDwd1vOIFhzO420pRRLI4q+9mHfAcLKHW0vGe
 1eWya/fFeFLxnju8=
X-Received: by 2002:a5d:4565:0:b0:2bf:cba5:6add with SMTP id
 a5-20020a5d4565000000b002bfcba56addmr10807523wrc.58.1675054926864; 
 Sun, 29 Jan 2023 21:02:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/ADhkpGsFBJlStX4FcZ2jR7tKyH9NUoX1HlcPj1rowW/Q6318ROLIAp+xG+4YoqaFkGix6OQ==
X-Received: by 2002:a5d:4565:0:b0:2bf:cba5:6add with SMTP id
 a5-20020a5d4565000000b002bfcba56addmr10807515wrc.58.1675054926696; 
 Sun, 29 Jan 2023 21:02:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a17-20020a5d53d1000000b0024cb961b6aesm10547425wrw.104.2023.01.29.21.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:02:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 06/21] madvise: Add QEMU_MADV_COLLAPSE
In-Reply-To: <20230117220914.2062125-7-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:08:59 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-7-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:02:05 +0100
Message-ID: <87h6w8k436.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> MADV_COLLAPSE is a new madvise() on Linux.  Define it.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


