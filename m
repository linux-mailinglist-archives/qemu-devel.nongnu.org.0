Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01E4A788E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:13:55 +0100 (CET)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFL4j-0007qd-DX
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFJZq-0000uM-Kj
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:37:56 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFJZm-0004UC-5L
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=DNFpbriaW/sJeuET+PytZhwCekiTy5WR94y/+uyaGPU=; b=sBBy1Xd9xA10SmGapidMJb5gZG
 dAZSSYowb6UzPqBxGoGWI+tUmIV83dO17wtgsvY8LqAXltZxfnpo3k78Ks0YoMrq8Qa1kMMdPmD42
 A4kvSVjbxExKUQW7xNBMp9jZBaLleCobSXJ88pgijSHcG0ANEFytaIwQHbscsCDw6FqJKKv4ZAUMU
 Q2FNiuur81R/xRBWNIkRhMFfluwWrHcNMxZLV/AanMjm6j33dfXxUb1m0tCk9hrxBYP/V+ydSLHGE
 txQmQTCbshBnw+zrpvNdYqKP+y32mPTPypaBH1o0HHw5wQE1E84UtPCMzqlEfb4cU/bWuhNLg3tr1
 DDE+ItHk/pidH7TsCmL+VGcZOZsu2ZzRA3FNHh43zOAJX+ElGlq0PKYAOQkBeZwmlVMIy9R3BpsXH
 D1NJpt2uiVFYJwRhg5dnPjJF9tfqcDfJG/DU4uqIR5EWc6z/APX8FdRkPYwTYcsCqJs2G8umo7OhZ
 sb46z49ilZpB8K8mOFsx+CknypPbHZo1i2WBgwEWk4GHPmjpZjqZY/0OFdmxTXjnCzHlXEOyI1oX6
 geAHFt4GgbWKAoRbgwM8sYqxbmvmkfn4ZpxerKayRVWMMWFirMrl/sfchx0L5jJ93a1M8oo1a5P7r
 Bxx0/9FUwuL/a+wpvYzDzokrvqcY6Z5z80WLnVMt8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v3 04/11] 9p: darwin: Handle struct dirent differences
Date: Wed, 02 Feb 2022 18:37:37 +0100
Message-ID: <4982610.5BtrrgmkuT@silver>
In-Reply-To: <CAB26zV0zKNzQ-Fk-TAq-UzqyuThW_aubHR+5+iE+SNZonRALQA@mail.gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-5-wwcohen@gmail.com>
 <CAB26zV0zKNzQ-Fk-TAq-UzqyuThW_aubHR+5+iE+SNZonRALQA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 2. Februar 2022 16:07:09 CET Will Cohen wrote:
> Does the version proposed in v3 address the V9fsFidState issues? In 9p.c
> for v2 to v3, we propose
> 
> -    return telldir(fidp->fs.dir.stream);
> +    return v9fs_co_telldir(pdu, fidp);
> 
> and in codir.c from v2 to v3 we propose
> -        saved_dir_pos = telldir(fidp->fs.dir.stream);
> +        saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
> 
> This removes the direct access to fidp->, and we hope this should be
> sufficient to avoid the concurrency
> and undefined behaviors you noted in the v2 review.

I am not sure why you think that you are no longer accessing fidp, you still 
do, just in a slightly different way.

Let me propose a different solution: on macOS there is 'd_seekoff' in struct 
dirent. As already discussed that dirent field is apparently unused (zero) by 
macOS. So what about filling this dirent field (early, on driver level, not on 
server/controller level [9p.c]) with telldir() for macOS, then you have the 
same info as other systems provide with dirent field 'd_off' later on.

Then you can add an inline helper function or a macro to deal with macOS vs. 
RoW, e.g.:

inline
off_t qemu_dirent_off(struct dirent *dent)
{
#ifdef CONFIG_DARWIN
    return dent->d_seekoff;
#else
    return dent->d_off;
#endif
}

And in 9p.c at all locations where dent->d_off is currently accessed, you 
would just use that helper instead.

Best regards,
Christian Schoenebeck



