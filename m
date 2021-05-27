Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ED73931AB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:04:29 +0200 (CEST)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHYi-0003vY-DO
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lmHVE-0000lg-4o
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:00:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lmHV9-0001Af-3K
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622127644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNOxeK+XVSuktMzh+0jvBZkL4ysNI5vrEgKeS1mbDuA=;
 b=DiW7jYlDRZInhQ4QPs9LSM9nHivsYpPLNJk52y9VL8yqDg0tIr0nD66llWp1uwIT/ydKYy
 dHx3O6atDTf74aVB2IFnqnZNoNEbS14v2r5w8UzSJi1Zo6v4uwqOGAJibb0GIVqQ7xQSjc
 gwWh761vmNWn5cdhfeK4GMX9gZ7kVaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-JYTCsAaaPmGfOuywLtCN-g-1; Thu, 27 May 2021 11:00:41 -0400
X-MC-Unique: JYTCsAaaPmGfOuywLtCN-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77103106BAAA
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 15:00:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-232.ams2.redhat.com
 [10.36.114.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D486E60864;
 Thu, 27 May 2021 15:00:32 +0000 (UTC)
Subject: Re: [Virtio-fs] [PATCH 1/3] virtiofsd: Find original inode ID of
 mount points
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210512125544.9536-1-mreitz@redhat.com>
 <20210512125544.9536-2-mreitz@redhat.com>
 <20210526181324.GA1222711@redhat.com> <20210526185017.GB1225492@horse>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b066027e-1733-8ca3-00e2-68e58aa8e563@redhat.com>
Date: Thu, 27 May 2021 17:00:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526185017.GB1225492@horse>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.05.21 20:50, Vivek Goyal wrote:
> On Wed, May 26, 2021 at 02:13:24PM -0400, Vivek Goyal wrote:
>> On Wed, May 12, 2021 at 02:55:42PM +0200, Max Reitz wrote:
>>> Mount point directories represent two inodes: On one hand, they are a
>>> normal directory on their parent filesystem.  On the other, they are the
>>> root node of the filesystem mounted there.  Thus, they have two inode
>>> IDs.
>>>
>>> Right now, we only report the latter inode ID (i.e. the inode ID of the
>>> mounted filesystem's root node).  This is fine once the guest has
>>> auto-mounted a submount there (so this inode ID goes with a device ID
>>> that is distinct from the parent filesystem), but before the auto-mount,
>>> they have the device ID of the parent and the inode ID for the submount.
>>> This is problematic because this is likely exactly the same
>>> st_dev/st_ino combination as the parent filesystem's root node.  This
>>> leads to problems for example with `find`, which will thus complain
>>> about a filesystem loop if it has visited the parent filesystem's root
>>> node before, and then refuse to descend into the submount.
>>>
>>> There is a way to find the mount directory's original inode ID, and that
>>> is to readdir(3) the parent directory, look for the mount directory, and
>>> read the dirent.d_ino field.  Using this, we can let lookup and
>>> readdirplus return that original inode ID, which the guest will thus
>>> show until the submount is auto-mounted.
>>
>>> (Then, it will invoke getattr
>>> and that stat(2) call will return the inode ID for the submount.)
>>
>> Hi Max,
>>
>> How are we sure that GETATTR() will always be called and that will
>> allow us to return inode number in mounted filesystem (instead of
>> parent filesystem). I thought GETATTR will be called only if cached
>> attrs have expired. (1 second default for cache=auto). Otherwise
>> stat() will fill inode->i_no from cache and return. And I am afraid
>> that in that case we will return inode number from parent fs,
>> instead of mounted fs.
>>
>> Say following sequence of events happens pretty fast one after the
>> other. Say /mnt/virtiofs/foo is a mount point in server but client
>> has not created submount yet.
>>
>> A. stat(/mnt/virtiofs/foo, AT_NO_AUTOMOUNT)
>>     -> This should get inode number in parent filesystem on host and
>>        store in guest inode->i_no and return to user space. Say inode
>>        in guest is called a_ino.
>> B. stat(/mnt/virtiofs/foo)
>>     -> This should create submount and create new inode (say b_ino), using
>>        properties from a_ino. IOW, this should copy a_ino->i_no to
>>        b_ino->b_ino given current code, IIUC.
>>
>>     -> Assume timeout has not happened and cached attrs have not expired.
>>
>>     -> And now b_ino->i_no (or ->orig_ino) will be returned to user space.

Well, I mean, this sounds easy enough to test.  For example, this passes 
for me:

count=1000
root_st_ino=128
tag=host
mountpoint=/mnt
submount_path=submount

for i in $(seq $count)
do
     mount -t virtiofs $tag $mountpoint || break
     if [ $(stat -c '%i' $mountpoint/$submount_path) -eq $root_st_ino ]
     then
         echo 'fail 0'
         break
     fi
     ls $mountpoint/$submount_path > /dev/null
     if [ $(stat -c '%i' $mountpoint/$submount_path) -ne $root_st_ino ]
     then
         echo 'fail 1'
         break
     fi
     umount $mountpoint || break
done
if [ $i -ne $count ]
then
     echo 'Something failed'
else
     echo 'OK'
fi

>> Am I missing something. Do we need to always expire inode attrs when
>> we create submount so that client is forced to issue GETATTR.
> 
> Looks like while initialzing b_ino, we are setting attr_valid=0, which
> should set fi->i_time=0 and force issuing GETATTR later.
> 
> fuse_fill_super_submount()
>    root = fuse_iget(sb, parent_fi->nodeid, 0, &root_attr, 0, 0);
>                                                           ^
>      fuse_iget(attr_valid=0)
>         fuse_change_attributes(attr_valid=0)
> 	  fuse_change_attributes_common(attr_valid=0)
>              fi->i_time = attr_valid;
> 
> So may be this will force GETATTR and fetch new inode id when second
> stat() is called.

i_time is at least what fuse_update_get_attr() uses to decide whether to 
invoke GETATTR or not – although AT_STATX_DONT_SYNC can override that, 
but I don’t think that’s a problem.  If i_time is 0, that function will 
always invoke GETATTR (unless AT_STATX_DONT_SYNC).

So I think it works in practice.  When the inode ID is looked up through 
some stat-y function, this should go through fuse_update_get_attr(), 
which will fetch the st_ino on the submount.  There is still i_ino, 
though...

To be absolutely certain, we could invoke fuse_update_attributes() in 
fuse_fill_super_submount(), but then again, fuse_fill_super_common() 
doesn’t do that either for its root node.  It just initializes i_ino to 
FUSE_ROOT_ID, i.e. 1.

Max


