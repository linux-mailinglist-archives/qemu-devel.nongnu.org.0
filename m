Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF993687AE4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXDu-0007GM-Ua; Thu, 02 Feb 2023 05:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXDs-0007EO-7h
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:53:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXDq-0003OV-QY
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335222;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qc6GM2jT3to1vYmOSWbOnv+fInU0lF0yxURTeq4kUoc=;
 b=EVajUikb8ElX8ASZst/xhDTV2lge6YXMb7VdLdotgft2Fa2QEdC+d120uvN40eE8Z809Lr
 zOo/uTVdJMZbpU18YZAsH8OpQS7yog9JCHrO5pI5Isg4txOKME956QSBgkhgZP6ByBBebI
 njCi/rQBBVGfDGRPrhcEdXBeEKYY4n0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-syddLBQcP9ezL1t9l6VHCw-1; Thu, 02 Feb 2023 05:53:36 -0500
X-MC-Unique: syddLBQcP9ezL1t9l6VHCw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfe4cf000000b002bf9413bc50so163206wrm.16
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qc6GM2jT3to1vYmOSWbOnv+fInU0lF0yxURTeq4kUoc=;
 b=bN2n06L5grW48d7FsSkoRbFYsiyjP8yAu8+91bymmZVKxvJOdAYfzbpm3wm15KWw56
 g7NjmKzmtqHHTCkw7AUzDXs6yk+vCewOzfOCKIFcpj7nB2r+m+uiqWKcsqGYTQDKXhXT
 ODuwlFTzn/t8Txduyt6EGWv4mBazY8VP3MhPXic4L73TEFT3OWYQIZMaQ60r9/OJZ/hg
 JNQhc0mB0vQSM1wDkMT3YD+JTmHGVIpWJeziTW0pVybARQQnZGA3/uAfMpKAS/k+EqVk
 fTzl6qLDgtS6ht/jks5ftXUUNcFwqPyJO3dJD/HmoGMJ2VbeCrY32iaAkex9FsZ1st/h
 EFLQ==
X-Gm-Message-State: AO0yUKWo3aK80h2cdClkR5w+5NW8/8RPJG8DjuRDRFdx4aa/5SApoX5i
 XKLJOgbNpqXXd5rVHeNG7Wdd8JXJ1FX235z46wnr5gMqCjnYfWx1A/auDWEFOa+zEJpzcOPxgR0
 BJ8L+F1KFOXI4bvE=
X-Received: by 2002:a5d:6906:0:b0:2bf:b7e3:7c82 with SMTP id
 t6-20020a5d6906000000b002bfb7e37c82mr4680494wru.57.1675335215697; 
 Thu, 02 Feb 2023 02:53:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8AQ/By1mQCz1eAeGz7dQQCX1UbaWwYrVYfASOyF/RArsmCoY6rSscBRG2l7xm/oo/a+NSlDQ==
X-Received: by 2002:a5d:6906:0:b0:2bf:b7e3:7c82 with SMTP id
 t6-20020a5d6906000000b002bfb7e37c82mr4680479wru.57.1675335215533; 
 Thu, 02 Feb 2023 02:53:35 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k10-20020adff28a000000b002b9b9445149sm11758561wro.54.2023.02.02.02.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:53:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  Michal =?utf-8?B?UHLDrXZvem7DrWs=?=
 <mprivozn@redhat.com>,  Daniel P
 . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/3] linux-headers: Update to v6.1
In-Reply-To: <20230201211055.649442-2-peterx@redhat.com> (Peter Xu's message
 of "Wed, 1 Feb 2023 16:10:53 -0500")
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:53:34 +0100
Message-ID: <878rhgtk29.fsf@secure.mitica>
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
> Signed-off-by: Peter Xu <peterx@redhat.com>

How does this change gets into the tree?

I know that it is "automagically" generated, but who decides when that
goes into the tree?

As we need that for the following patch?

Later, Juan.


