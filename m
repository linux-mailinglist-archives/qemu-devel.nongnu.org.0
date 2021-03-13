Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A687339E0D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 13:32:35 +0100 (CET)
Received: from localhost ([::1]:33358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL3Ra-0001R6-29
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 07:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL3Po-0000vE-9c
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL3Pl-0005Wo-Az
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615638639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=baET3CWlwMMR6TBqS3X3rS34jlEuNtJ1+bvMDEBzqes=;
 b=ROddFoEIjqEJ3yseOGRrXPkdbjnA/KueDRDSX/OWpz4xMSHgc19aX6Vs+nAW8662HlzhZK
 oBbGMi11KtMB9ftBZdNZWIbPt2GMzrc1BfLd7PY27YiyhfuZgZ/hrSQlPoTBvIDGLTF47q
 9IBcKnMF7xaJllFgjmXyxS9qZIxF6yA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-yQCQd5ETO1aAMdBeuTChag-1; Sat, 13 Mar 2021 07:30:37 -0500
X-MC-Unique: yQCQd5ETO1aAMdBeuTChag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F3C1C288;
 Sat, 13 Mar 2021 12:30:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E86F19D80;
 Sat, 13 Mar 2021 12:30:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 827361132C12; Sat, 13 Mar 2021 13:30:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 26/30] qemu-img: Use user_creatable_process_cmdline()
 for --object
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-27-kwolf@redhat.com>
 <87k0qby00g.fsf@dusky.pond.sub.org>
 <95899a3d-ae3e-c635-d381-502da7d1bc5b@redhat.com>
Date: Sat, 13 Mar 2021 13:30:27 +0100
In-Reply-To: <95899a3d-ae3e-c635-d381-502da7d1bc5b@redhat.com> (Paolo
 Bonzini's message of "Sat, 13 Mar 2021 08:47:12 +0100")
Message-ID: <87mtv7tevw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 13/03/21 08:40, Markus Armbruster wrote:
>>> +                if (!user_creatable_add_from_str(optarg, &local_err)) {
>>> +                    if (local_err) {
>>> +                        error_report_err(local_err);
>>> +                        exit(2);
>>> +                    } else {
>>> +                        /* Help was printed */
>>> +                        exit(EXIT_SUCCESS);
>>> +                    }
>>> +                }
>>> +                break;
>>>               }
>>> -        }   break;
>>>           case OPTION_IMAGE_OPTS:
>>>               image_opts = true;
>>>               break;
>> Why is this one different?  The others all call
>> user_creatable_process_cmdline().
>> 
>> 
>
> It's to exit with status code 2 instead of 1.

I see.  Worth a comment?


