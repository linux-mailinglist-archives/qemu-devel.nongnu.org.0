Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567D045B806
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:07:11 +0100 (CET)
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppBG-00062U-5i
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp4C-0001hc-UV
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp4A-0005O6-Rt
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747990;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7+C7YervxAbWZ0hyOEKVmm92DrujisQlcjUqeuUtL1A=;
 b=TiL7VZvF44MSqxeoFG5Ae0z+N5bZK1Imr22Gbz+uJP+4bN0WHGaaXruzvoPkOyo6Wld48C
 FbO6HTUkMg4CavUst/RlO4Zc6m+TL288Y9MV9IDHELfSxyHM/IGTKue8oeXCke1XzGhWy9
 v9cnZ1Cwn2mm54k0r/BmPDvVCwcdKDw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-514-pYnH1FKyMVqKMdTvMgGV9g-1; Wed, 24 Nov 2021 04:59:49 -0500
X-MC-Unique: pYnH1FKyMVqKMdTvMgGV9g-1
Received: by mail-wm1-f71.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso1061029wma.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=7+C7YervxAbWZ0hyOEKVmm92DrujisQlcjUqeuUtL1A=;
 b=YHQ8GuiEeaTaP0toGeEmxmEZ4uvd1/UC+EoeQX+zOJ/OZbunE+PEOq0gdbgeIhdop0
 MJZLD/e/e8hZWXcZUbfQGi5oas725UU7eJt/xnwyXVJU8sQ9X1+mX6yHMReoMTMNeqTM
 nZn9F0ySBa92U7u0Kg672r5ITGi7WDr4Df0XPjQnkcn9z+99y+NjBRhrq8a0cWrCYuaE
 rrPUy/7yFQMNNiUN/xTOAsc0Zvj+QOwvyzml8+HOGGZY7a1UPcXvu6CNadFED5HTeJLn
 0bFeA/shWwtPHMNQqVCBwHM5awCw5GV7DT+hBtY3J7lpc/hDEp+5LrT+B9x+FLUYOaDt
 Uz6Q==
X-Gm-Message-State: AOAM531pvQKoAW8KDJgOmNDbRU4XYzzq3Rm8gw3cs7FjvXuAslBC+u3E
 AGtJYWUsX7Z/dW/0NZcvNLubaGPSMfBO+WkxYdoISCLQMwsmGAhYrD6JapF0WpHoq+41tq3RZW+
 l/s67mL9MKjXJha8DjTCNB95lPxKb+WGZsx0YrSfrBJvbnGAtyOlShxqREqkH1OWufl8=
X-Received: by 2002:a5d:6091:: with SMTP id w17mr16844336wrt.65.1637747987766; 
 Wed, 24 Nov 2021 01:59:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylwIzZzo5AZab8wy92kk6ioCxIhWV2WIW95wKaq3G2T4e3fFroN0j2ZhWi0eWiyfNv5YVNnw==
X-Received: by 2002:a5d:6091:: with SMTP id w17mr16844298wrt.65.1637747987551; 
 Wed, 24 Nov 2021 01:59:47 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id s8sm14845612wro.19.2021.11.24.01.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:59:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/23] Migration: Transmit and detect zero pages in
 the multifd threads
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com> (Juan Quintela's
 message of "Wed, 24 Nov 2021 10:54:37 +0100")
References: <20211124095500.42078-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 24 Nov 2021 10:59:46 +0100
Message-ID: <871r35ho19.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> Hi
>
> This is a rebase against last master.
>
> And the reason for resend is to configure properly git-publish and
> hope this time that git-publish send all the patches.
>
> Please, review.

And here we are, mail server disturbance again.

Nack.


