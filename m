Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9751C6EB3F5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:55:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyid-0007OU-PP; Fri, 21 Apr 2023 17:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppyib-0007NZ-ET
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppyia-0006Ye-31
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682114099;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2+h6HCg2VmpCbQ1l7KME9dp3WaVpL8ZtkNzmv6e58A=;
 b=jNV8gMvM19rxJCcTi+Jg/3eP+WYLd5jNM5jDbNWB1LBJH1TCEUWN+qnL3KfuH5/d6hoFRC
 iKikwQ2rjrFfKMx7cOECkFLtZAM+ZLqeD09GZj483kN8WDeuaAWOwKdD/9hmH3tDOgZwHY
 uMcOo8PGtpbrNwlhVcsFexyc36+0w38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-2X_I5bBgNUaScYmSYe1UgQ-1; Fri, 21 Apr 2023 17:54:58 -0400
X-MC-Unique: 2X_I5bBgNUaScYmSYe1UgQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-302cdf5d034so916884f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 14:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114097; x=1684706097;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T2+h6HCg2VmpCbQ1l7KME9dp3WaVpL8ZtkNzmv6e58A=;
 b=CDPkqAwAy02OE4wtRnKXUOyMokbbp/VUh44+yMuNIPKm82EbmWtPwq4Hb34l9diFRM
 6zjPTFTN+i/wkw9AC2Rgx1PtAhKskJCdmjBmAuT0cNu99F66gGQjnmlljAoY5Lb79hHw
 ZEJrWOuCv6/CwqbDt6d7aCZOa/GrN26E8uLXCoxt9dGATo+OiJmUTXncjrlxI8fadLbg
 QHxH5wm7hJzO48jbCjJT4tgXi8U/Y4dGvk4bf2FZ5wYmJ3etw+u5oMATyRvgWjLDP5Wz
 9eYAdEZ/qx/1jwgpcv2WOwCoV/RUzd+/DTjDqANjkR83lLKhw3DcL8IZ7FYkao2uH99F
 Ac9Q==
X-Gm-Message-State: AAQBX9cI0OgY0Zjxw4qlqObz4mUaVatizHKpE3n8UIaPCeVOuRfZU7qz
 xhwinxcnOdl7dI2uPKWk2jNhz5t021TEoMFlVFooj2tTX1ftym/j6EWg6d6pGQwkolfT9iumQv/
 m1iY02u9ZW5nshow=
X-Received: by 2002:adf:e38d:0:b0:2d9:81b2:322a with SMTP id
 e13-20020adfe38d000000b002d981b2322amr5038407wrm.55.1682114096978; 
 Fri, 21 Apr 2023 14:54:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350YnWaGbQoBQ0+Vtvj9x1d4ziugGudrClIdmgcOIzKRHfA9sKEG4jyPuZkp9pNL20PbhdcZ9Bw==
X-Received: by 2002:adf:e38d:0:b0:2d9:81b2:322a with SMTP id
 e13-20020adfe38d000000b002d981b2322amr5038395wrm.55.1682114096660; 
 Fri, 21 Apr 2023 14:54:56 -0700 (PDT)
Received: from redhat.com ([31.4.212.142]) by smtp.gmail.com with ESMTPSA id
 p17-20020a056000019100b002fda1b12a0bsm5319619wrx.2.2023.04.21.14.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 14:54:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Zhang Chen <chen.zhang@intel.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH v2 2/6] tests/qtests: remove migration test iterations
 config
In-Reply-To: <20230421171411.566300-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Fri, 21 Apr 2023 18:14:07
 +0100")
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-3-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 21 Apr 2023 23:54:55 +0200
Message-ID: <87r0scgats.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The 'unsigned int interations' config for migration is somewhat
> overkill. Most tests don't set it, and a value of '0' is treated
> as equivalent to '1'. The only test that does set it, xbzrle,
> used a value of '2'.
>
> This setting, however, only relates to the migration iterations
> that take place prior to allowing convergence. IOW, on top of
> this iteration count, there is always at least 1 further migration
> iteration done to deal with pages that are dirtied during the
> previous iteration(s).
>
> IOW, even with iterations=3D=3D1, the xbzrle test will be running for
> a minimum of 2 iterations. With this in mind we can simplify the
> code and just get rid of the special case.

Perhaps the old code was already wrong, but we need at least three
iterations for the xbzrle test:
- 1st iteration: xbzrle is not used, nothing is on cache.
- 2nd iteration: pages are put into cache, no xbzrle is used because
  there is no previous page.
- 3rd iteration: We really use xbzrle now against the copy of the
  previous iterations.

And yes, this should be commented somewhere.

Later, Juan.




