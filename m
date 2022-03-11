Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF2C4D57CD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:58:27 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUXw-0007Ey-Ev
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUPd-0004ls-Hw
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:49:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUPc-0003uW-4i
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSW2W0GXMtl+X328mp8gsTeI9xeXwJR1dTbJb4z749A=;
 b=ga4QXMomp2tHEsYv5RQknYghtuPgxrvFknkT4L/VuWV8rlW8IDwrfG7136D4VroyGUghtK
 PVoTmnxeNqh0IkYcBUPoPoefvYMcgP0ckezSymqMUYVW6sbofsP3E09WevvKBRVwNzmF/H
 KpCf5CrMRgv/3/1tUrQ94zFoTR9RrnU=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-WIeMK1LaPIqtpLk83QlMPg-1; Thu, 10 Mar 2022 20:49:44 -0500
X-MC-Unique: WIeMK1LaPIqtpLk83QlMPg-1
Received: by mail-pg1-f197.google.com with SMTP id
 bh9-20020a056a02020900b0036c0d29eb3eso3903730pgb.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gSW2W0GXMtl+X328mp8gsTeI9xeXwJR1dTbJb4z749A=;
 b=VMHssYzITscR1JMsfrzC6o51T2WxbOUpGCeVhtwLQYkvqbf5jUAWh43UhkICvGG3t7
 cHJTIMjkfSP9NJ/f7oKRCbdxM1tVBYiT+y4sizk9Bk2zug9JEalFbqbx00RjxPmXSFzK
 wbKSxQu0jIPmx7jKSpJPzNKovT77bXjCDTd8oqy4sLNEvtVbTpFYqRO/RHJe+qONthDG
 643q35tjKYQ3PP0p4LdeY1K/ts3kuMYzHoKtKLXlWjumjuakVcBVNYiVw2lGEMYtcEEG
 at4spf4d+wjcjRrgD9LnZYs5c9gPfZEmVyueQegnENMVC+Cz32bZcQcFNWaD9qyQpO7b
 f1XQ==
X-Gm-Message-State: AOAM531hqshl/wLxis4oaz1DAghg77LV5xDm9KQ255VVpqeKF7CbyPuo
 0icGvL4yuTNhaqZSC8/NWDbyPUCOCUGRrFwg5LS9yV7eG/bcPdQwqUQTo9sZso3KJBGSy+nrQ3j
 tbVDL5poL2BYvaiU=
X-Received: by 2002:a17:90b:3ec7:b0:1bf:457e:c281 with SMTP id
 rm7-20020a17090b3ec700b001bf457ec281mr19219207pjb.145.1646963383333; 
 Thu, 10 Mar 2022 17:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcIiqEKMlUhbuz05mZAAejO760P7vhJo//tunkovvzBoH/7Me8SLyEa2tIG4GhkkSD7F37Wg==
X-Received: by 2002:a17:90b:3ec7:b0:1bf:457e:c281 with SMTP id
 rm7-20020a17090b3ec700b001bf457ec281mr19219187pjb.145.1646963383067; 
 Thu, 10 Mar 2022 17:49:43 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f2a4316a0asm7948658pfv.60.2022.03.10.17.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:49:42 -0800 (PST)
Date: Fri, 11 Mar 2022 09:49:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 10/18] tests: switch migration FD passing test to use
 common precopy helper
Message-ID: <YiqqsYpUOEXZftvb@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-11-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-11-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 05:18:13PM +0000, Daniel P. Berrangé wrote:
> The combination of the start and finish hooks allow the FD passing
> code to use the precopy helper
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


