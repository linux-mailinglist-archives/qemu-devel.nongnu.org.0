Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCB50795C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:46:40 +0200 (CEST)
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngss3-00036Y-GX
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ngsnw-0001um-2D
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ngsnl-0002Pn-Np
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650393733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k58luO8zcU0LEdsf0eg0sjJ746NRtNU1acENC03rL84=;
 b=QeL5kuRHX2oKcpmCqj5opMVNMuCnFNbUuEd9pQQLjqSmdsQ6Epxau3sQHh5+20lMyh5esC
 a2X2m2voA9RQEv1kSM+EQA3AeGC+W8Ospva9tUq9DO9t25E92skzQmyNYunZ7uyhTGLyz9
 B5bCa8+z71yvXENtjM40FLzhuhER6rA=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-cBsKQQWgML-kEfDCqDb0HQ-1; Tue, 19 Apr 2022 14:42:09 -0400
X-MC-Unique: cBsKQQWgML-kEfDCqDb0HQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 a18-20020a25bad2000000b0063360821ea7so15564724ybk.15
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=k58luO8zcU0LEdsf0eg0sjJ746NRtNU1acENC03rL84=;
 b=5w0pm09pxmi0wq8LucCIXZ2zCVC0Krhf1wFOJHOftQ3iFKzWoALajWt6mO7Mgo8w5p
 BcRaEOrRW+R73w2dmP+asCK+dkXMqNyw451aMdvOWRfd+zDJLJc21s61gHLnc1nI2k4C
 gmrwd30K80qwlUQyjhJMST0NeJ3KIlGjCHAMWh6DcHz8LwjwIMRpvJRu6XTJFr0tj9Tf
 rW9KnVWPb7lRJvgSpdwyyJRjFbtEbDNP9HlIC61dr8iMbMrFm+d2w6gRP85xfPdI62QW
 7Sz00bbvnukXp843iDC4cb1C77TjV3pTBBsFuW4RtpTSvCq3/4Wbxs0xv4v/pzuSXBYb
 pFPw==
X-Gm-Message-State: AOAM533KChbt5b8LLHGVdH3yXpySPcowcF+wagSRph1d8j46XvSngbtA
 cps3SbUsKAnfw/jNsfcxvR6CB+ELE+kkhnBOqphTINYOwBVySHOcC5NAt0ymwg0sRn6A2K6bp/v
 bsPXTNZICw5sP9hvTUJe+ye3G+kf9cME=
X-Received: by 2002:a25:2405:0:b0:645:3c70:5ba2 with SMTP id
 k5-20020a252405000000b006453c705ba2mr4449965ybk.547.1650393729270; 
 Tue, 19 Apr 2022 11:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCarE5Gzu2K9CxtTGjqUywqbY//Q/8+VN8fMpkzNoh2c2tWLvO4uCFK1N/ijvRd05R5/ixNb3C4z5jV+RwGaI=
X-Received: by 2002:a25:2405:0:b0:645:3c70:5ba2 with SMTP id
 k5-20020a252405000000b006453c705ba2mr4449944ybk.547.1650393729092; Tue, 19
 Apr 2022 11:42:09 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Apr 2022 11:42:08 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
Date: Tue, 19 Apr 2022 11:42:08 -0700
Message-ID: <CABJz62Pqxmwedz7B-D6cx0vpdmVPy_TvVjhih9cu+XHvn74U0w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 11:12:28AM -0700, Andrea Bolognani wrote:
> Dealing with errors and commands that don't have a return value might
> require us to have generic CommandResult wrapper after all, but we
> should really try as hard as we can to stick to type safe interfaces.

On second thought, this wouldn't actually need to be generic: we
could have something like

  type TraceEventGetStateResult struct {
      Result TraceEventInfo `json:"return"`
      Error  *Error         `json:"error"`
  }

and the caller would check that res.Error is nil before accessing
res.Result.

Commands for which a return value is not expected would just have the
Error part in their corresponding Result struct, and those that can
either return an object or nothing (are there actually any like
that?) could have a pointer as the Result member.

-- 
Andrea Bolognani / Red Hat / Virtualization


